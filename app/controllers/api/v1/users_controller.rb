class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: [:logout]
  
  def facebook
    if params[:facebook_access_token]
      graph = Koala::Facebook::API.new(params[:facebook_access_token])
      user_data = graph.get_object("me?fields=name,email,id,picture")
      user = User.find_by(email: user_data['email'])
      if user
        user.generate_authentication_token
        user.save
        render json: user, status: :ok
      else
        user = User.new(
                      fullname: user_data['fullname'],
                      email: user_data['email'],
                      uid: user_data['id'],
                      provider: 'Facebook',
                      image: user_data['picture']['data']['url']
                )
        user.generate_authentication_token
        
        if user.save
          render json: user, status: :ok
          
        else
          render json: { error: user.errors, is_success: false}, status: 422
        end
          
      end
    else
      render json: { error: "Invalid Facebook Token", is_success: false}, status: unprocessable_entity
    end
  end
  
  def logout
    user = User.find_by(access_token: params[:access_token])
    user.generate_authentication_token
    user.save
    render json: { is_success: true }, status: :ok
  end
  
  def add_card
    user = User.find(current_user.id)
    if user.stripe_id.blank?
      customer = Stripe::Customer.create(
        email: user.email
      )
      user.stripe_id = customer.id
      user.save
    else
      customer = Stripe::Customer.retrieve(user.stripe_id)
    end
    
    customer.sources.create(source: params[:stripe_token])
    render json: { is_success: true }, status: :ok
    
  rescue Stripe::CardError => e
    render json: { error: e.message, is_success: false }, status: :not_found
  end
  
end
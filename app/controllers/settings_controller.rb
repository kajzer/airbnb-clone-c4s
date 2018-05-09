class SettingsController < ApplicationController
    def edit
       @setting = User.find(current_user.id).setting
    end 
    
    def update
        @setting = User.find(current_user.id).setting
        if @setting.update(setting_params)
            flash[:notice] = "Saved!"
        else
            flash[:alert] = "Couldn't save"
        end
        render 'edit'
    end
    
    private
    
        def setting_params
            params.require(:setting).permit(:enable_sms, :enable_email)
        end
end
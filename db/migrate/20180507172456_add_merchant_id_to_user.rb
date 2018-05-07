class AddMerchantIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :merchant_id, :string
  end
end

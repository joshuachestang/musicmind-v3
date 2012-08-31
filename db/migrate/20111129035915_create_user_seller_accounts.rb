class CreateUserSellerAccounts < ActiveRecord::Migration
  def change
    create_table :user_seller_accounts do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end

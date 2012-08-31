class CreateUserAccessRequests < ActiveRecord::Migration
  def change
    create_table :user_access_requests do |t|
      t.string :email

      t.timestamps
    end
  end
end

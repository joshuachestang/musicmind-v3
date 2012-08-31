class UserPurchaseAccount < ActiveRecord::Base
	validates :first_name, :last_name, :payment_type, :card_type, :account_number, :expiration_date, :security_code, :presence => true

	belongs_to :user, dependent: :destroy
end

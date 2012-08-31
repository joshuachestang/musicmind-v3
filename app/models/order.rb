class Order < ActiveRecord::Base
	belongs_to :cart
  has_many :transactions, :class_name => "OrderTransaction"
  attr_accessor :card_number, :card_verification
  validate :validate_card, on: :create



# goal: to create master song relationships with the user who purchased the master_song. each master song in the cart the 
#user will own! using the method own! which will create a master_song Relationship with the song in the user's model.

#steps for adding credits to cart
#1. create form for user credits to be placed in cart - 
#  --form_for credit_amount attr_accessor :credit_amount and make line_item
#2. enter order info
#3. on create, update the user models credit_balance with credit_amount

 #Paypal purchasing method. 
  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def purchase_money
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents_2, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end
  
  #converts cart total price to pennies
  def price_in_cents
    (cart.total_price*100).round
  end

  def price_in_cents_2
    (cart.money.purchase_amount*100).round
  end


  private
  
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Joshua Chestang",
        :address1 => "528 Columbia Rd. NW",
        :city     => "Washington",
        :state    => "DC",
        :country  => "US",
        :zip      => "20001"
      }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end


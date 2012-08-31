class LineItem < ActiveRecord::Base
  belongs_to :master_song
  belongs_to :cart

  attr_accessible :master_song_id, :price



#user should only be able to purchase song once unless gifting someone else
def total_price
  master_song.price * quantity
end

  #if LineItem for @user then
  	#create_master_song_relationships with @user                
end

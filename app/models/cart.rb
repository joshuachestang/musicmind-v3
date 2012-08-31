 class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :order


#Adding master song data to cart for purchase
  def add_master_song(master_song_id)
    current_item = line_items.find_by_master_song_id(master_song_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(master_song_id: master_song_id)
      current_item.price = current_item.master_song.price
    end
      current_item
  end

#total price of items in cart
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

   def remove_master_song(master_song_id)
    current_item = line_items.find_by_master_song_id(master_song_id)
    current_item.destroy
   end  
end

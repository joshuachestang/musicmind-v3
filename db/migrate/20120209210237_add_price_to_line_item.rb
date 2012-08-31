class AddPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal
    LineItem.all.each do |li|
      li.price = li.master_song.price
    end
  end
end

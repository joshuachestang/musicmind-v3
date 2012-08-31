class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :master_song_id
      t.integer :cart_id

      t.timestamps
    end
  end
end

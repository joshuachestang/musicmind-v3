class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.has_attached_file :album_artwork
      t.text :album_title
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end

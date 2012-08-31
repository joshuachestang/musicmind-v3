class CreateMasterSongs < ActiveRecord::Migration
  def change
    create_table :master_songs do |t|
    	t.integer :user_id
    	t.has_attached_file :m_song
      t.has_attached_file :song_art_work
      t.decimal :price, precision: 8, scale: 2
      t.integer :song_listens_count, :default => 0
      t.integer :song_up_votes_count, :default => 0
      t.integer :master_song_comments_count, :default => 0
      t.string :m_song_fingerprint
      t.datetime :release_date
      t.string :title
      t.string :artist
      t.string :album
      t.text :album_title
      t.integer :length
      t.string :slug
      t.boolean :playable, :default => true

      
      t.timestamps
    end
  end
end

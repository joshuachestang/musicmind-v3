class CreateUserSongUploads < ActiveRecord::Migration
  def change
    create_table :user_song_uploads do |t|
    	t.integer :user_id
    	t.has_attached_file :song
    	t.boolean :favorite
    	t.string :song_fingerprint
      t.integer :song_listens_count, :default => 0
    	t.string :title
    	t.string :artist
    	t.string :album
      t.integer :length
      t.timestamps
    end
  end
end

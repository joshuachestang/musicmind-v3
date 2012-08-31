class CreateMasterSongComments < ActiveRecord::Migration
  def change
    create_table :master_song_comments do |t|
      t.integer :user_id
      t.integer :master_song_id
      t.text :comment

      t.timestamps
    end
  end
end

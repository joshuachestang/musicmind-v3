class CreateSongUpVotes < ActiveRecord::Migration
  def change
    create_table :song_up_votes do |t|
      t.integer :user_id
      t.integer :master_song_id
      t.timestamps
    end
  end
end

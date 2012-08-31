class CreateSongListens < ActiveRecord::Migration
  def change
    create_table :song_listens do |t|
      t.integer :user_id
      t.references :listenable, :polymorphic => true

      t.timestamps
    end
  end
end

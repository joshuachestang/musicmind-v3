class CreateMasterSongRelationships < ActiveRecord::Migration
  def change
    create_table :master_song_relationships do |t|
      t.integer :owner_id
      t.integer :owned_id
      t.boolean :favorite

      t.timestamps
    end

    add_index :master_song_relationships, :owner_id
    add_index :master_song_relationships, :owned_id
    add_index :master_song_relationships, [:owner_id, :owned_id], :unique => true
  end
end

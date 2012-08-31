class CreateFanRelationships < ActiveRecord::Migration
  def self.up
    create_table :fan_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :fan_relationships, :follower_id
    add_index :fan_relationships, :followed_id
    add_index :fan_relationships, [:follower_id, :followed_id], :unique => true
  end

  def self.down
    drop_table :fan_relationships
  end
end

class CreateFanBases < ActiveRecord::Migration
  def change
    create_table :fan_bases do |t|
      t.string :name
      t.integer :user_id
      t.has_attached_file :fb_art
      t.string :type_of_music_entity
      t.string :verification
      t.text :status_message
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end

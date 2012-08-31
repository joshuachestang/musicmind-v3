class AddSlugToMasterSongs < ActiveRecord::Migration
  def change
    add_column :master_songs, :slug, :string
    add_index :master_songs, :slug
  end
end

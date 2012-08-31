class AddSlugToFanBases < ActiveRecord::Migration
  def change
    add_column :fan_bases, :slug, :string
    add_index :fan_bases, :slug

  end
end

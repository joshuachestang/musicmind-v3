class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.integer :fan_base_id
      t.string :name
      t.has_attached_file :label_image

      t.timestamps
    end
  end
end

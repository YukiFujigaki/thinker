class CreateTagMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_maps do |t|
      t.integer :role_model_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

    add_index :tag_maps, [:role_model_id, :tag_id], unique: true
  end
end

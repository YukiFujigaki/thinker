class AddColumnRoleModels < ActiveRecord::Migration[6.1]
  def change
    add_column :role_models, :user_id, :integer, null: false, after: :id
  end
end

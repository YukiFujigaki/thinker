class AddColumnUserProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :introduction, :string
    add_column :user_profiles, :image, :string
    add_column :user_profiles, :background_image, :string
  end
end

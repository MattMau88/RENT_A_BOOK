class ChangeProfilePhotoInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :profile_photo, :string, null: true

  end
end

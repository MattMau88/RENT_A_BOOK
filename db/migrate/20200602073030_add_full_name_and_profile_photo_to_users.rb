class AddFullNameAndProfilePhotoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string, null: false, default: ""
    # initially we will enforce an avator upload through url string
    add_column :users, :profile_photo, :string, null: false
  end
end

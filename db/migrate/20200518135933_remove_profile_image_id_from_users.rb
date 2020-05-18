class RemoveProfileImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :string, :profile_image_id
  end
end

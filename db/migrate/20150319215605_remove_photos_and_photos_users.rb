class RemovePhotosAndPhotosUsers < ActiveRecord::Migration
  def change
    drop_table :photos_users
    drop_table :photos
  end
end

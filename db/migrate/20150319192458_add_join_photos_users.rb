class AddJoinPhotosUsers < ActiveRecord::Migration
  def change
    create_table :photos_users do |t|
      t.belongs_to :photo
      t.belongs_to :user
    end

    create_table :photos do |t|
      t.attachment :file
    end
  end
end

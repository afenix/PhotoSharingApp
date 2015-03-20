class AddPhotosBelongingToUsers < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :file
      t.column :user_id, :integer

      t.timestamps
    end
  end
end

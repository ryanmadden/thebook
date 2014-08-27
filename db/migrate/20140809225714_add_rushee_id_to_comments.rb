class AddRusheeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :rushee_id, :int
    add_column :comments, :body, :text
    add_column :comments, :user_id, :int
  end
end

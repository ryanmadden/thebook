class AddRusheeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :rushee_id, :int
    add_column :comments, :body, :text
  end
end
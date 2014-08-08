class RemoveTitleFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :title, :string
    remove_column :comments, :commentable_id, :integer
    remove_column :comments, :commentable_type, :string
    remove_column :comments, :role, :string
    add_column :comments, :rushee_id, :int
  end
end

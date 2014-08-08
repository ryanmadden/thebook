class RemoveCommentFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment, :text
    add_column :comments, :body, :text
  end
end

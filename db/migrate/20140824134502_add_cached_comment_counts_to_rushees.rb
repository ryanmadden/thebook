class AddCachedCommentCountsToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :comments_count, :integer, :default => 0, :null => false
  end
end
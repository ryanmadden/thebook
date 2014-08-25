class AddInfoToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :fb, :string
    add_column :rushees, :major, :string
    add_column :rushees, :hometown, :string
    add_column :rushees, :campus_involvement, :string
  end
end

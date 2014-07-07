class CreateRushees < ActiveRecord::Migration
  def change
    create_table :rushees do |t|
      t.string :name
      t.string :age
      t.string :bio

      t.timestamps
    end
  end
end

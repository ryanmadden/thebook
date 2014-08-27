class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.int :id
      t.int :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.int :rushee_id
      t.text :body
      t.int :user_id

      t.timestamps
    end
  end
end

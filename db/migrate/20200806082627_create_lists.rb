class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :like_count
      t.references :user, null: false
      t.timestamps
    end
  end
end

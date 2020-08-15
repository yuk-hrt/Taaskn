class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :memo, null: false
      t.boolean :done, null: false, default: false
      t.references :list, null: false
      t.integer :row_order
      t.timestamps
    end
  end
end

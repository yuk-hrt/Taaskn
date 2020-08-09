class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :memo, null: false
      t.references :list, null: false
      t.timestamps
    end
  end
end

class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.references :author, index: true, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end

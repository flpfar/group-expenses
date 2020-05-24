class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :author, index: true, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end

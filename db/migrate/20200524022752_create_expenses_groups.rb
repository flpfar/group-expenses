class CreateExpensesGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses_groups do |t|
      t.references :group, foreign_key: true
      t.references :expense, foreign_key: true
    end
  end
end

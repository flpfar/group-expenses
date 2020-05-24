class CreateGroupsTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_transactions do |t|
      t.references :group, foreign_key: { to_table: :groups }
      t.references :transaction, foreign_key: true
    end
  end
end

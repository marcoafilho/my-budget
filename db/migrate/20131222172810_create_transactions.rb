class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :account
      t.string :description
      t.string :type
      t.decimal :amount
      t.date :due_at

      t.timestamps
    end

    add_index :transactions, :account_id
  end
end

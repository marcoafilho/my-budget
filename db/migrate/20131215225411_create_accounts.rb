class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user
      t.references :currency
      t.string :name
      t.string :kind

      t.timestamps
    end

    add_index :accounts, :name
    add_index :accounts, :user_id
    add_index :accounts, :currency_id
  end
end

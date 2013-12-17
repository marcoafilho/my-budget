class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user
      t.string :name
      t.string :kind
      t.string :currency

      t.timestamps
    end

    add_index :accounts, :name
  end
end

class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.integer :minor_unit
    end

    add_index :currencies, :code, unique: true
  end
end

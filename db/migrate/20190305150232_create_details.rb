class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :transaction_id
      t.integer :stock_id
      t.integer :amount

      t.timestamps
    end
  end
end

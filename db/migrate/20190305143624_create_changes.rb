class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|
      t.integer :amount
      t.string :type
      t.integer :stock_id

      t.timestamps
    end
  end
end

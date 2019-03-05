class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :idStock
      t.string :namaBarang
      t.integer :hargaBarang
      t.integer :jumlagStock

      t.timestamps
    end
  end
end

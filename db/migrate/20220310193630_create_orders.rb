class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :merchant, null: false, foreign_key: true
      t.belongs_to :shopper, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :created_at, null: false
      t.datetime :completed_at
    end
  end
end

class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.belongs_to :merchant, null: false, foreign_key: true
      t.decimal :amount, null: false, precision: 14, scale: 4
      t.datetime :start_at, null: false
    end
    add_index :disbursements, :start_at
  end
end

class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name, limit: 100
      t.string :email, limit: 40
      t.string :cif, limit: 10
    end
  end
end

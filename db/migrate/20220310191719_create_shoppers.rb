class CreateShoppers < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppers do |t|
      t.string :name, limit: 100
      t.string :email, limit: 40
      t.string :nif, limit: 10
    end
  end
end

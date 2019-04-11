class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.string :customer_name
      t.float :price
      t.belongs_to :brew

      t.timestamps
    end
  end
end

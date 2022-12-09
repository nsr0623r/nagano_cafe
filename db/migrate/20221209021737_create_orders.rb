class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :total_payment
      t.integer :shipping_cost
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end

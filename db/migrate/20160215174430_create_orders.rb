class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :payment_type
      t.string :note

      t.timestamps null: false
    end
  end
end

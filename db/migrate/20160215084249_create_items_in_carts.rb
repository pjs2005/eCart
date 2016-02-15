class CreateItemsInCarts < ActiveRecord::Migration
  def change
    create_table :items_in_carts do |t|
      t.references :product, index: true, foreign_key: true
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

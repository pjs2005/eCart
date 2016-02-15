class AddOrderToItemsInCart < ActiveRecord::Migration
  def change
    add_reference :items_in_carts, :order, index: true, foreign_key: true
  end
end

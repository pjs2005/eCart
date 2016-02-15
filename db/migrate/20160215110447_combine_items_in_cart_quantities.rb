class CombineItemsInCartQuantities < ActiveRecord::Migration
	def up
		Cart.all.each do |cart|
			total = cart.items_in_carts.group(:product_id).sum(:quantity)

			total.each do | product_id, quantity| 
				if quantity > 1

					cart.items_in_carts.where(product_id).delete_all

					item = cart.items_in_carts.build(product_id: product_id)
					item.quantity = quantity
					item.save!
				end

			end
		end
	end

	def down
		ItemsInCart.where("quantity > ? ", 1).each do |item|
			item.quantity.times do
				ItemsInCart.create cart_id: item.cart.id,
				product_id: item.product_id, quantity: 1
			end
			item.destroy
		end
	end
end

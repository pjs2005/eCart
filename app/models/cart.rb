class Cart < ActiveRecord::Base
	has_many :items_in_carts, dependent: :destroy

	def add_product(product_id)
		current_item = items_in_carts.find_by(product_id: product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = items_in_carts.build(product_id: product_id)
		end
		current_item
	end
end

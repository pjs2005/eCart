class Order < ActiveRecord::Base
	has_many :items_in_carts, dependent: :destroy
	PAYMENT_TYPES = [ "Check",  "Invoice", "Purchase Order", "Visa" ]
	validates :name, :address, :email, presence: true
	validates :payment_type, inclusion: PAYMENT_TYPES

	def add_items_in_cart_from_cart(cart)
		cart.items_in_carts.each do |product|
			product.cart_id = nil
			items_in_carts << product
		end
	end

end

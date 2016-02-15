class StoreController < ApplicationController
	include CurrentCart
	before_action :set_cart
  def index
  	@products = Product.order(:title)
  	#fresh_when(@products)
  end
end

class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	fresh_when(@products)
  end
end

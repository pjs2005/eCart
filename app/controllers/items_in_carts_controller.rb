class ItemsInCartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_items_in_cart, only: [:show, :edit, :update, :destroy]

  # GET /items_in_carts
  # GET /items_in_carts.json
  def index
    @items_in_carts = ItemsInCart.all
  end

  # GET /items_in_carts/1
  # GET /items_in_carts/1.json
  def show
  end

  # GET /items_in_carts/new
  def new
    @items_in_cart = ItemsInCart.new
  end

  # GET /items_in_carts/1/edit
  def edit
  end

  # POST /items_in_carts
  # POST /items_in_carts.json
  def create
    product = Product.find(params[:product_id])
    @items_in_cart = @cart.add_product(product.id)

    respond_to do |format|
      if @items_in_cart.save
        format.html { redirect_to @items_in_cart.cart }
        format.json { render :show, status: :created, location: @items_in_cart }
      else
        format.html { render :new }
        format.json { render json: @items_in_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_in_carts/1
  # PATCH/PUT /items_in_carts/1.json
  def update
    respond_to do |format|
      if @items_in_cart.update(items_in_cart_params)
        format.html { redirect_to @items_in_cart, notice: 'Items in cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_in_cart }
      else
        format.html { render :edit }
        format.json { render json: @items_in_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_in_carts/1
  # DELETE /items_in_carts/1.json
  def destroy

    cart =  @items_in_cart.cart
    @items_in_cart.destroy
    respond_to do |format|
      format.html { redirect_to cart, notice: 'Items in cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_in_cart
      @items_in_cart = ItemsInCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def items_in_cart_params
      params.require(:items_in_cart).permit(:product_id)
    end
end

require 'test_helper'

class ItemsInCartsControllerTest < ActionController::TestCase
  setup do
    @items_in_cart = items_in_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items_in_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create items_in_cart" do
    assert_difference('ItemsInCart.count') do
      post :create, product_id: products(:three).id 
    end

    assert_redirected_to store_path
  end

  test "should show items_in_cart" do
    get :show, id: @items_in_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @items_in_cart
    assert_response :success
  end

  test "should update items_in_cart" do
    patch :update, id: @items_in_cart, items_in_cart: { product_id: @items_in_cart.product_id }
    assert_redirected_to items_in_cart_path(assigns(:items_in_cart))
  end

  test "should destroy items_in_cart" do
    assert_difference('ItemsInCart.count', -1) do
      delete :destroy, id: @items_in_cart
    end

    assert_redirected_to store_path
  end
end

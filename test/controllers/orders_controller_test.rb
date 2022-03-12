require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      post orders_url, params: { order: { amount: @order.amount, completed_at: @order.completed_at, created_at: @order.created_at, id: @order.id, merchant_id_id: @order.merchant_id_id, shopper_id_id: @order.shopper_id_id } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { amount: @order.amount, completed_at: @order.completed_at, created_at: @order.created_at, id: @order.id, merchant_id_id: @order.merchant_id_id, shopper_id_id: @order.shopper_id_id } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference("Order.count", -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end

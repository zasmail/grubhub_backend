require 'test_helper'

class StartOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @start_order = start_orders(:one)
  end

  test "should get index" do
    get start_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_start_order_url
    assert_response :success
  end

  test "should create start_order" do
    assert_difference('StartOrder.count') do
      post start_orders_url, params: { start_order: {  } }
    end

    assert_redirected_to start_order_url(StartOrder.last)
  end

  test "should show start_order" do
    get start_order_url(@start_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_start_order_url(@start_order)
    assert_response :success
  end

  test "should update start_order" do
    patch start_order_url(@start_order), params: { start_order: {  } }
    assert_redirected_to start_order_url(@start_order)
  end

  test "should destroy start_order" do
    assert_difference('StartOrder.count', -1) do
      delete start_order_url(@start_order)
    end

    assert_redirected_to start_orders_url
  end
end

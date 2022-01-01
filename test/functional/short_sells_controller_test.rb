require 'test_helper'

class ShortSellsControllerTest < ActionController::TestCase
  setup do
    @short_sell = short_sells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:short_sells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short_sell" do
    assert_difference('ShortSell.count') do
      post :create, short_sell: { chart: @short_sell.chart, date: @short_sell.date, fee: @short_sell.fee, kind: @short_sell.kind, net: @short_sell.net, price: @short_sell.price, qty: @short_sell.qty, status: @short_sell.status, vat: @short_sell.vat }
    end

    assert_redirected_to short_sell_path(assigns(:short_sell))
  end

  test "should show short_sell" do
    get :show, id: @short_sell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @short_sell
    assert_response :success
  end

  test "should update short_sell" do
    put :update, id: @short_sell, short_sell: { chart: @short_sell.chart, date: @short_sell.date, fee: @short_sell.fee, kind: @short_sell.kind, net: @short_sell.net, price: @short_sell.price, qty: @short_sell.qty, status: @short_sell.status, vat: @short_sell.vat }
    assert_redirected_to short_sell_path(assigns(:short_sell))
  end

  test "should destroy short_sell" do
    assert_difference('ShortSell.count', -1) do
      delete :destroy, id: @short_sell
    end

    assert_redirected_to short_sells_path
  end
end

require 'test_helper'

class CoverBuysControllerTest < ActionController::TestCase
  setup do
    @cover_buy = cover_buys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cover_buys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cover_buy" do
    assert_difference('CoverBuy.count') do
      post :create, cover_buy: { chart: @cover_buy.chart, date: @cover_buy.date, days: @cover_buy.days, fee: @cover_buy.fee, net: @cover_buy.net, percent: @cover_buy.percent, price: @cover_buy.price, profit: @cover_buy.profit, sequence: @cover_buy.sequence, vat: @cover_buy.vat, yearly: @cover_buy.yearly }
    end

    assert_redirected_to cover_buy_path(assigns(:cover_buy))
  end

  test "should show cover_buy" do
    get :show, id: @cover_buy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cover_buy
    assert_response :success
  end

  test "should update cover_buy" do
    put :update, id: @cover_buy, cover_buy: { chart: @cover_buy.chart, date: @cover_buy.date, days: @cover_buy.days, fee: @cover_buy.fee, net: @cover_buy.net, percent: @cover_buy.percent, price: @cover_buy.price, profit: @cover_buy.profit, sequence: @cover_buy.sequence, vat: @cover_buy.vat, yearly: @cover_buy.yearly }
    assert_redirected_to cover_buy_path(assigns(:cover_buy))
  end

  test "should destroy cover_buy" do
    assert_difference('CoverBuy.count', -1) do
      delete :destroy, id: @cover_buy
    end

    assert_redirected_to cover_buys_path
  end
end

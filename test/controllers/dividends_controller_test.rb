require 'test_helper'

class DividendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dividend = dividends(:one)
  end

  test "should get index" do
    get dividends_url
    assert_response :success
  end

  test "should get new" do
    get new_dividend_url
    assert_response :success
  end

  test "should create dividend" do
    assert_difference('Dividend.count') do
      post dividends_url, params: { dividend: { net: @dividend.net, number: @dividend.number, p_date: @dividend.p_date, ppu: @dividend.ppu, quarter: @dividend.quarter, stock_id: @dividend.stock_id, x_date: @dividend.x_date, year: @dividend.year } }
    end

    assert_redirected_to dividend_url(Dividend.last)
  end

  test "should show dividend" do
    get dividend_url(@dividend)
    assert_response :success
  end

  test "should get edit" do
    get edit_dividend_url(@dividend)
    assert_response :success
  end

  test "should update dividend" do
    patch dividend_url(@dividend), params: { dividend: { net: @dividend.net, number: @dividend.number, p_date: @dividend.p_date, ppu: @dividend.ppu, quarter: @dividend.quarter, stock_id: @dividend.stock_id, x_date: @dividend.x_date, year: @dividend.year } }
    assert_redirected_to dividend_url(@dividend)
  end

  test "should destroy dividend" do
    assert_difference('Dividend.count', -1) do
      delete dividend_url(@dividend)
    end

    assert_redirected_to dividends_url
  end
end

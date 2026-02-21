require "test_helper"

class CondimentAmtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @condiment_amt = condiment_amts(:one)
  end

  test "should get index" do
    get condiment_amts_url
    assert_response :success
  end

  test "should get new" do
    get new_condiment_amt_url
    assert_response :success
  end

  test "should create condiment_amt" do
    assert_difference("CondimentAmt.count") do
      post condiment_amts_url, params: { condiment_amt: { index: @condiment_amt.index, large: @condiment_amt.large, medium: @condiment_amt.medium, small: @condiment_amt.small } }
    end

    assert_redirected_to condiment_amt_url(CondimentAmt.last)
  end

  test "should show condiment_amt" do
    get condiment_amt_url(@condiment_amt)
    assert_response :success
  end

  test "should get edit" do
    get edit_condiment_amt_url(@condiment_amt)
    assert_response :success
  end

  test "should update condiment_amt" do
    patch condiment_amt_url(@condiment_amt), params: { condiment_amt: { index: @condiment_amt.index, large: @condiment_amt.large, medium: @condiment_amt.medium, small: @condiment_amt.small } }
    assert_redirected_to condiment_amt_url(@condiment_amt)
  end

  test "should destroy condiment_amt" do
    assert_difference("CondimentAmt.count", -1) do
      delete condiment_amt_url(@condiment_amt)
    end

    assert_redirected_to condiment_amts_url
  end
end

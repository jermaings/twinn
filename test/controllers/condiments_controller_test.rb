require "test_helper"

class CondimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @condiment = condiments(:one)
  end

  test "should get index" do
    get condiments_url
    assert_response :success
  end

  test "should get new" do
    get new_condiment_url
    assert_response :success
  end

  test "should create condiment" do
    assert_difference("Condiment.count") do
      post condiments_url, params: { condiment: { checked: @condiment.checked, index: @condiment.index, name: @condiment.name, price: @condiment.price } }
    end

    assert_redirected_to condiment_url(Condiment.last)
  end

  test "should show condiment" do
    get condiment_url(@condiment)
    assert_response :success
  end

  test "should get edit" do
    get edit_condiment_url(@condiment)
    assert_response :success
  end

  test "should update condiment" do
    patch condiment_url(@condiment), params: { condiment: { checked: @condiment.checked, index: @condiment.index, name: @condiment.name, price: @condiment.price } }
    assert_redirected_to condiment_url(@condiment)
  end

  test "should destroy condiment" do
    assert_difference("Condiment.count", -1) do
      delete condiment_url(@condiment)
    end

    assert_redirected_to condiments_url
  end
end

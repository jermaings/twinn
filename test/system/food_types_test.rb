require "application_system_test_case"

class FoodTypesTest < ApplicationSystemTestCase
  setup do
    @food_type = food_types(:one)
  end

  test "visiting the index" do
    visit food_types_url
    assert_selector "h1", text: "Food types"
  end

  test "should create food type" do
    visit food_types_url
    click_on "New food type"

    fill_in "Category", with: @food_type.category
    fill_in "Foods", with: @food_type.foods_id
    fill_in "Image", with: @food_type.image
    fill_in "Name", with: @food_type.name
    fill_in "Price", with: @food_type.price
    fill_in "Size", with: @food_type.size
    click_on "Create Food type"

    assert_text "Food type was successfully created"
    click_on "Back"
  end

  test "should update Food type" do
    visit food_type_url(@food_type)
    click_on "Edit this food type", match: :first

    fill_in "Category", with: @food_type.category
    fill_in "Foods", with: @food_type.foods_id
    fill_in "Image", with: @food_type.image
    fill_in "Name", with: @food_type.name
    fill_in "Price", with: @food_type.price
    fill_in "Size", with: @food_type.size
    click_on "Update Food type"

    assert_text "Food type was successfully updated"
    click_on "Back"
  end

  test "should destroy Food type" do
    visit food_type_url(@food_type)
    click_on "Destroy this food type", match: :first

    assert_text "Food type was successfully destroyed"
  end
end

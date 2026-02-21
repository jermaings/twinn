require "application_system_test_case"

class CondimentsTest < ApplicationSystemTestCase
  setup do
    @condiment = condiments(:one)
  end

  test "visiting the index" do
    visit condiments_url
    assert_selector "h1", text: "Condiments"
  end

  test "should create condiment" do
    visit condiments_url
    click_on "New condiment"

    check "Checked" if @condiment.checked
    fill_in "Index", with: @condiment.index
    fill_in "Name", with: @condiment.name
    fill_in "Price", with: @condiment.price
    click_on "Create Condiment"

    assert_text "Condiment was successfully created"
    click_on "Back"
  end

  test "should update Condiment" do
    visit condiment_url(@condiment)
    click_on "Edit this condiment", match: :first

    check "Checked" if @condiment.checked
    fill_in "Index", with: @condiment.index
    fill_in "Name", with: @condiment.name
    fill_in "Price", with: @condiment.price
    click_on "Update Condiment"

    assert_text "Condiment was successfully updated"
    click_on "Back"
  end

  test "should destroy Condiment" do
    visit condiment_url(@condiment)
    click_on "Destroy this condiment", match: :first

    assert_text "Condiment was successfully destroyed"
  end
end

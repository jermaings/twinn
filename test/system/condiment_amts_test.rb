require "application_system_test_case"

class CondimentAmtsTest < ApplicationSystemTestCase
  setup do
    @condiment_amt = condiment_amts(:one)
  end

  test "visiting the index" do
    visit condiment_amts_url
    assert_selector "h1", text: "Condiment amts"
  end

  test "should create condiment amt" do
    visit condiment_amts_url
    click_on "New condiment amt"

    fill_in "Index", with: @condiment_amt.index
    check "Large" if @condiment_amt.large
    check "Medium" if @condiment_amt.medium
    check "Small" if @condiment_amt.small
    click_on "Create Condiment amt"

    assert_text "Condiment amt was successfully created"
    click_on "Back"
  end

  test "should update Condiment amt" do
    visit condiment_amt_url(@condiment_amt)
    click_on "Edit this condiment amt", match: :first

    fill_in "Index", with: @condiment_amt.index
    check "Large" if @condiment_amt.large
    check "Medium" if @condiment_amt.medium
    check "Small" if @condiment_amt.small
    click_on "Update Condiment amt"

    assert_text "Condiment amt was successfully updated"
    click_on "Back"
  end

  test "should destroy Condiment amt" do
    visit condiment_amt_url(@condiment_amt)
    click_on "Destroy this condiment amt", match: :first

    assert_text "Condiment amt was successfully destroyed"
  end
end

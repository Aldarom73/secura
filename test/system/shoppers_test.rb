require "application_system_test_case"

class ShoppersTest < ApplicationSystemTestCase
  setup do
    @shopper = shoppers(:one)
  end

  test "visiting the index" do
    visit shoppers_url
    assert_selector "h1", text: "Shoppers"
  end

  test "should create shopper" do
    visit shoppers_url
    click_on "New shopper"

    fill_in "Email", with: @shopper.email
    fill_in "Id", with: @shopper.id
    fill_in "Name", with: @shopper.name
    fill_in "Nif", with: @shopper.nif
    click_on "Create Shopper"

    assert_text "Shopper was successfully created"
    click_on "Back"
  end

  test "should update Shopper" do
    visit shopper_url(@shopper)
    click_on "Edit this shopper", match: :first

    fill_in "Email", with: @shopper.email
    fill_in "Id", with: @shopper.id
    fill_in "Name", with: @shopper.name
    fill_in "Nif", with: @shopper.nif
    click_on "Update Shopper"

    assert_text "Shopper was successfully updated"
    click_on "Back"
  end

  test "should destroy Shopper" do
    visit shopper_url(@shopper)
    click_on "Destroy this shopper", match: :first

    assert_text "Shopper was successfully destroyed"
  end
end

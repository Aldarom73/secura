require "application_system_test_case"

class DisbursementsTest < ApplicationSystemTestCase
  setup do
    @disbursement = disbursements(:one)
  end

  test "visiting the index" do
    visit disbursements_url
    assert_selector "h1", text: "Disbursements"
  end

  test "should create disbursement" do
    visit disbursements_url
    click_on "New disbursement"

    fill_in "Amount", with: @disbursement.amount
    fill_in "Id", with: @disbursement.id
    fill_in "Merchant", with: @disbursement.merchant_id
    fill_in "Start at", with: @disbursement.start_at
    click_on "Create Disbursement"

    assert_text "Disbursement was successfully created"
    click_on "Back"
  end

  test "should update Disbursement" do
    visit disbursement_url(@disbursement)
    click_on "Edit this disbursement", match: :first

    fill_in "Amount", with: @disbursement.amount
    fill_in "Id", with: @disbursement.id
    fill_in "Merchant", with: @disbursement.merchant_id
    fill_in "Start at", with: @disbursement.start_at
    click_on "Update Disbursement"

    assert_text "Disbursement was successfully updated"
    click_on "Back"
  end

  test "should destroy Disbursement" do
    visit disbursement_url(@disbursement)
    click_on "Destroy this disbursement", match: :first

    assert_text "Disbursement was successfully destroyed"
  end
end

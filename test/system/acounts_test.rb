require "application_system_test_case"

class AcountsTest < ApplicationSystemTestCase
  setup do
    @acount = acounts(:one)
  end

  test "visiting the index" do
    visit acounts_url
    assert_selector "h1", text: "Acounts"
  end

  test "should create acount" do
    visit acounts_url
    click_on "New acount"

    check "Active" if @acount.active
    fill_in "Client", with: @acount.client_id
    fill_in "Description", with: @acount.description
    fill_in "Fecha", with: @acount.fecha
    fill_in "Importe", with: @acount.importe
    click_on "Create Acount"

    assert_text "Acount was successfully created"
    click_on "Back"
  end

  test "should update Acount" do
    visit acount_url(@acount)
    click_on "Edit this acount", match: :first

    check "Active" if @acount.active
    fill_in "Client", with: @acount.client_id
    fill_in "Description", with: @acount.description
    fill_in "Fecha", with: @acount.fecha
    fill_in "Importe", with: @acount.importe
    click_on "Update Acount"

    assert_text "Acount was successfully updated"
    click_on "Back"
  end

  test "should destroy Acount" do
    visit acount_url(@acount)
    click_on "Destroy this acount", match: :first

    assert_text "Acount was successfully destroyed"
  end
end

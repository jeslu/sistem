require "application_system_test_case"

class CotizsTest < ApplicationSystemTestCase
  setup do
    @cotiz = cotizs(:one)
  end

  test "visiting the index" do
    visit cotizs_url
    assert_selector "h1", text: "Cotizs"
  end

  test "should create cotiz" do
    visit cotizs_url
    click_on "New cotiz"

    fill_in "Client", with: @cotiz.client_id
    fill_in "Fecha", with: @cotiz.fecha
    fill_in "User", with: @cotiz.user_id
    click_on "Create Cotiz"

    assert_text "Cotiz was successfully created"
    click_on "Back"
  end

  test "should update Cotiz" do
    visit cotiz_url(@cotiz)
    click_on "Edit this cotiz", match: :first

    fill_in "Client", with: @cotiz.client_id
    fill_in "Fecha", with: @cotiz.fecha
    fill_in "User", with: @cotiz.user_id
    click_on "Update Cotiz"

    assert_text "Cotiz was successfully updated"
    click_on "Back"
  end

  test "should destroy Cotiz" do
    visit cotiz_url(@cotiz)
    click_on "Destroy this cotiz", match: :first

    assert_text "Cotiz was successfully destroyed"
  end
end

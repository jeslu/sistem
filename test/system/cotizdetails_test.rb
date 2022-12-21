require "application_system_test_case"

class CotizdetailsTest < ApplicationSystemTestCase
  setup do
    @cotizdetail = cotizdetails(:one)
  end

  test "visiting the index" do
    visit cotizdetails_url
    assert_selector "h1", text: "Cotizdetails"
  end

  test "should create cotizdetail" do
    visit cotizdetails_url
    click_on "New cotizdetail"

    check "Active" if @cotizdetail.active
    fill_in "Cant", with: @cotizdetail.cant
    fill_in "Cotiz", with: @cotizdetail.cotiz_id
    fill_in "Product", with: @cotizdetail.product_id
    fill_in "Servicio", with: @cotizdetail.servicio_id
    fill_in "Total", with: @cotizdetail.total
    click_on "Create Cotizdetail"

    assert_text "Cotizdetail was successfully created"
    click_on "Back"
  end

  test "should update Cotizdetail" do
    visit cotizdetail_url(@cotizdetail)
    click_on "Edit this cotizdetail", match: :first

    check "Active" if @cotizdetail.active
    fill_in "Cant", with: @cotizdetail.cant
    fill_in "Cotiz", with: @cotizdetail.cotiz_id
    fill_in "Product", with: @cotizdetail.product_id
    fill_in "Servicio", with: @cotizdetail.servicio_id
    fill_in "Total", with: @cotizdetail.total
    click_on "Update Cotizdetail"

    assert_text "Cotizdetail was successfully updated"
    click_on "Back"
  end

  test "should destroy Cotizdetail" do
    visit cotizdetail_url(@cotizdetail)
    click_on "Destroy this cotizdetail", match: :first

    assert_text "Cotizdetail was successfully destroyed"
  end
end

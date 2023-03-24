require "application_system_test_case"

class SaledetailsTest < ApplicationSystemTestCase
  setup do
    @saledetail = saledetails(:one)
  end

  test "visiting the index" do
    visit saledetails_url
    assert_selector "h1", text: "Saledetails"
  end

  test "should create saledetail" do
    visit saledetails_url
    click_on "New saledetail"

    check "Active" if @saledetail.active
    fill_in "Cantidad", with: @saledetail.cantidad
    fill_in "Importe", with: @saledetail.importe
    fill_in "Product", with: @saledetail.product_id
    fill_in "Sale", with: @saledetail.sale_id
    click_on "Create Saledetail"

    assert_text "Saledetail was successfully created"
    click_on "Back"
  end

  test "should update Saledetail" do
    visit saledetail_url(@saledetail)
    click_on "Edit this saledetail", match: :first

    check "Active" if @saledetail.active
    fill_in "Cantidad", with: @saledetail.cantidad
    fill_in "Importe", with: @saledetail.importe
    fill_in "Product", with: @saledetail.product_id
    fill_in "Sale", with: @saledetail.sale_id
    click_on "Update Saledetail"

    assert_text "Saledetail was successfully updated"
    click_on "Back"
  end

  test "should destroy Saledetail" do
    visit saledetail_url(@saledetail)
    click_on "Destroy this saledetail", match: :first

    assert_text "Saledetail was successfully destroyed"
  end
end

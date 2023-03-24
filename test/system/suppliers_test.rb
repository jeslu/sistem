require "application_system_test_case"

class SuppliersTest < ApplicationSystemTestCase
  setup do
    @supplier = suppliers(:one)
  end

  test "visiting the index" do
    visit suppliers_url
    assert_selector "h1", text: "Suppliers"
  end

  test "should create supplier" do
    visit suppliers_url
    click_on "New supplier"

    fill_in "Cel pro", with: @supplier.cel_pro
    fill_in "Direcction", with: @supplier.direcction
    fill_in "Email pro", with: @supplier.email_pro
    fill_in "Name pro", with: @supplier.name_pro
    fill_in "Nota", with: @supplier.nota
    click_on "Create Supplier"

    assert_text "Supplier was successfully created"
    click_on "Back"
  end

  test "should update Supplier" do
    visit supplier_url(@supplier)
    click_on "Edit this supplier", match: :first

    fill_in "Cel pro", with: @supplier.cel_pro
    fill_in "Direcction", with: @supplier.direcction
    fill_in "Email pro", with: @supplier.email_pro
    fill_in "Name pro", with: @supplier.name_pro
    fill_in "Nota", with: @supplier.nota
    click_on "Update Supplier"

    assert_text "Supplier was successfully updated"
    click_on "Back"
  end

  test "should destroy Supplier" do
    visit supplier_url(@supplier)
    click_on "Destroy this supplier", match: :first

    assert_text "Supplier was successfully destroyed"
  end
end

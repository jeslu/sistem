require "application_system_test_case"

class ExtentsTest < ApplicationSystemTestCase
  setup do
    @extent = extents(:one)
  end

  test "visiting the index" do
    visit extents_url
    assert_selector "h1", text: "Extents"
  end

  test "should create extent" do
    visit extents_url
    click_on "New extent"

    check "Active" if @extent.active
    fill_in "Extent", with: @extent.extent
    fill_in "Slug", with: @extent.slug
    click_on "Create Extent"

    assert_text "Extent was successfully created"
    click_on "Back"
  end

  test "should update Extent" do
    visit extent_url(@extent)
    click_on "Edit this extent", match: :first

    check "Active" if @extent.active
    fill_in "Extent", with: @extent.extent
    fill_in "Slug", with: @extent.slug
    click_on "Update Extent"

    assert_text "Extent was successfully updated"
    click_on "Back"
  end

  test "should destroy Extent" do
    visit extent_url(@extent)
    click_on "Destroy this extent", match: :first

    assert_text "Extent was successfully destroyed"
  end
end

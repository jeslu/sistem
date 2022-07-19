require "test_helper"

class ExtentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extent = extents(:one)
  end

  test "should get index" do
    get extents_url
    assert_response :success
  end

  test "should get new" do
    get new_extent_url
    assert_response :success
  end

  test "should create extent" do
    assert_difference("Extent.count") do
      post extents_url, params: { extent: { active: @extent.active, extent: @extent.extent, slug: @extent.slug } }
    end

    assert_redirected_to extent_url(Extent.last)
  end

  test "should show extent" do
    get extent_url(@extent)
    assert_response :success
  end

  test "should get edit" do
    get edit_extent_url(@extent)
    assert_response :success
  end

  test "should update extent" do
    patch extent_url(@extent), params: { extent: { active: @extent.active, extent: @extent.extent, slug: @extent.slug } }
    assert_redirected_to extent_url(@extent)
  end

  test "should destroy extent" do
    assert_difference("Extent.count", -1) do
      delete extent_url(@extent)
    end

    assert_redirected_to extents_url
  end
end

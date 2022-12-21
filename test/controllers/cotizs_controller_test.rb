require "test_helper"

class CotizsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cotiz = cotizs(:one)
  end

  test "should get index" do
    get cotizs_url
    assert_response :success
  end

  test "should get new" do
    get new_cotiz_url
    assert_response :success
  end

  test "should create cotiz" do
    assert_difference("Cotiz.count") do
      post cotizs_url, params: { cotiz: { client_id: @cotiz.client_id, fecha: @cotiz.fecha, user_id: @cotiz.user_id } }
    end

    assert_redirected_to cotiz_url(Cotiz.last)
  end

  test "should show cotiz" do
    get cotiz_url(@cotiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_cotiz_url(@cotiz)
    assert_response :success
  end

  test "should update cotiz" do
    patch cotiz_url(@cotiz), params: { cotiz: { client_id: @cotiz.client_id, fecha: @cotiz.fecha, user_id: @cotiz.user_id } }
    assert_redirected_to cotiz_url(@cotiz)
  end

  test "should destroy cotiz" do
    assert_difference("Cotiz.count", -1) do
      delete cotiz_url(@cotiz)
    end

    assert_redirected_to cotizs_url
  end
end

require "test_helper"

class CotizdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cotizdetail = cotizdetails(:one)
  end

  test "should get index" do
    get cotizdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_cotizdetail_url
    assert_response :success
  end

  test "should create cotizdetail" do
    assert_difference("Cotizdetail.count") do
      post cotizdetails_url, params: { cotizdetail: { active: @cotizdetail.active, cant: @cotizdetail.cant, cotiz_id: @cotizdetail.cotiz_id, product_id: @cotizdetail.product_id, servicio_id: @cotizdetail.servicio_id, total: @cotizdetail.total } }
    end

    assert_redirected_to cotizdetail_url(Cotizdetail.last)
  end

  test "should show cotizdetail" do
    get cotizdetail_url(@cotizdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_cotizdetail_url(@cotizdetail)
    assert_response :success
  end

  test "should update cotizdetail" do
    patch cotizdetail_url(@cotizdetail), params: { cotizdetail: { active: @cotizdetail.active, cant: @cotizdetail.cant, cotiz_id: @cotizdetail.cotiz_id, product_id: @cotizdetail.product_id, servicio_id: @cotizdetail.servicio_id, total: @cotizdetail.total } }
    assert_redirected_to cotizdetail_url(@cotizdetail)
  end

  test "should destroy cotizdetail" do
    assert_difference("Cotizdetail.count", -1) do
      delete cotizdetail_url(@cotizdetail)
    end

    assert_redirected_to cotizdetails_url
  end
end

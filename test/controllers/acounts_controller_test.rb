require "test_helper"

class AcountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acount = acounts(:one)
  end

  test "should get index" do
    get acounts_url
    assert_response :success
  end

  test "should get new" do
    get new_acount_url
    assert_response :success
  end

  test "should create acount" do
    assert_difference("Acount.count") do
      post acounts_url, params: { acount: { active: @acount.active, client_id: @acount.client_id, description: @acount.description, fecha: @acount.fecha, importe: @acount.importe } }
    end

    assert_redirected_to acount_url(Acount.last)
  end

  test "should show acount" do
    get acount_url(@acount)
    assert_response :success
  end

  test "should get edit" do
    get edit_acount_url(@acount)
    assert_response :success
  end

  test "should update acount" do
    patch acount_url(@acount), params: { acount: { active: @acount.active, client_id: @acount.client_id, description: @acount.description, fecha: @acount.fecha, importe: @acount.importe } }
    assert_redirected_to acount_url(@acount)
  end

  test "should destroy acount" do
    assert_difference("Acount.count", -1) do
      delete acount_url(@acount)
    end

    assert_redirected_to acounts_url
  end
end

require "test_helper"

class CuentClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuent_client = cuent_clients(:one)
  end

  test "should get index" do
    get cuent_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_cuent_client_url
    assert_response :success
  end

  test "should create cuent_client" do
    assert_difference("CuentClient.count") do
      post cuent_clients_url, params: { cuent_client: { active: @cuent_client.active, client_id: @cuent_client.client_id, fecha: @cuent_client.fecha, user_id: @cuent_client.user_id } }
    end

    assert_redirected_to cuent_client_url(CuentClient.last)
  end

  test "should show cuent_client" do
    get cuent_client_url(@cuent_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuent_client_url(@cuent_client)
    assert_response :success
  end

  test "should update cuent_client" do
    patch cuent_client_url(@cuent_client), params: { cuent_client: { active: @cuent_client.active, client_id: @cuent_client.client_id, fecha: @cuent_client.fecha, user_id: @cuent_client.user_id } }
    assert_redirected_to cuent_client_url(@cuent_client)
  end

  test "should destroy cuent_client" do
    assert_difference("CuentClient.count", -1) do
      delete cuent_client_url(@cuent_client)
    end

    assert_redirected_to cuent_clients_url
  end
end

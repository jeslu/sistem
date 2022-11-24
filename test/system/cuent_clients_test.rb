require "application_system_test_case"

class CuentClientsTest < ApplicationSystemTestCase
  setup do
    @cuent_client = cuent_clients(:one)
  end

  test "visiting the index" do
    visit cuent_clients_url
    assert_selector "h1", text: "Cuent clients"
  end

  test "should create cuent client" do
    visit cuent_clients_url
    click_on "New cuent client"

    check "Active" if @cuent_client.active
    fill_in "Client", with: @cuent_client.client_id
    fill_in "Fecha", with: @cuent_client.fecha
    fill_in "User", with: @cuent_client.user_id
    click_on "Create Cuent client"

    assert_text "Cuent client was successfully created"
    click_on "Back"
  end

  test "should update Cuent client" do
    visit cuent_client_url(@cuent_client)
    click_on "Edit this cuent client", match: :first

    check "Active" if @cuent_client.active
    fill_in "Client", with: @cuent_client.client_id
    fill_in "Fecha", with: @cuent_client.fecha
    fill_in "User", with: @cuent_client.user_id
    click_on "Update Cuent client"

    assert_text "Cuent client was successfully updated"
    click_on "Back"
  end

  test "should destroy Cuent client" do
    visit cuent_client_url(@cuent_client)
    click_on "Destroy this cuent client", match: :first

    assert_text "Cuent client was successfully destroyed"
  end
end

require "application_system_test_case"

class TouristRoutesTest < ApplicationSystemTestCase
  setup do
    @tourist_route = tourist_routes(:one)
  end

  test "visiting the index" do
    visit tourist_routes_url
    assert_selector "h1", text: "Tourist routes"
  end

  test "should create tourist route" do
    visit tourist_routes_url
    click_on "New tourist route"

    fill_in "Agency", with: @tourist_route.agency
    fill_in "Cost", with: @tourist_route.cost
    fill_in "Destination", with: @tourist_route.destination
    fill_in "Origin", with: @tourist_route.origin
    fill_in "Total days", with: @tourist_route.total_days
    click_on "Create Tourist route"

    assert_text "Tourist route was successfully created"
    click_on "Back"
  end

  test "should update Tourist route" do
    visit tourist_route_url(@tourist_route)
    click_on "Edit this tourist route", match: :first

    fill_in "Agency", with: @tourist_route.agency
    fill_in "Cost", with: @tourist_route.cost
    fill_in "Destination", with: @tourist_route.destination
    fill_in "Origin", with: @tourist_route.origin
    fill_in "Total days", with: @tourist_route.total_days
    click_on "Update Tourist route"

    assert_text "Tourist route was successfully updated"
    click_on "Back"
  end

  test "should destroy Tourist route" do
    visit tourist_route_url(@tourist_route)
    click_on "Destroy this tourist route", match: :first

    assert_text "Tourist route was successfully destroyed"
  end
end

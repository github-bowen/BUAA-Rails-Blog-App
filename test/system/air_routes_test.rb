require "application_system_test_case"

class AirRoutesTest < ApplicationSystemTestCase
  setup do
    @air_route = air_routes(:one)
  end

  test "visiting the index" do
    visit air_routes_url
    assert_selector "h1", text: "Air routes"
  end

  test "should create air route" do
    visit air_routes_url
    click_on "New air route"

    fill_in "Departure time", with: @air_route.departure_time
    fill_in "From", with: @air_route.from
    check "Is direct" if @air_route.is_direct
    fill_in "Landing time", with: @air_route.landing_time
    fill_in "To", with: @air_route.to
    click_on "Create Air route"

    assert_text "Air route was successfully created"
    click_on "Back"
  end

  test "should update Air route" do
    visit air_route_url(@air_route)
    click_on "Edit this air route", match: :first

    fill_in "Departure time", with: @air_route.departure_time
    fill_in "From", with: @air_route.from
    check "Is direct" if @air_route.is_direct
    fill_in "Landing time", with: @air_route.landing_time
    fill_in "To", with: @air_route.to
    click_on "Update Air route"

    assert_text "Air route was successfully updated"
    click_on "Back"
  end

  test "should destroy Air route" do
    visit air_route_url(@air_route)
    click_on "Destroy this air route", match: :first

    assert_text "Air route was successfully destroyed"
  end
end

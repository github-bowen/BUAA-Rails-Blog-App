require "test_helper"

class AirRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @air_route = air_routes(:one)
  end

  test "should get index" do
    get air_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_air_route_url
    assert_response :success
  end

  test "should create air_route" do
    assert_difference("AirRoute.count") do
      post air_routes_url, params: { air_route: { departure_time: @air_route.departure_time, from: @air_route.from, is_direct: @air_route.is_direct, landing_time: @air_route.landing_time, to: @air_route.to } }
    end

    assert_redirected_to air_route_url(AirRoute.last)
  end

  test "should show air_route" do
    get air_route_url(@air_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_air_route_url(@air_route)
    assert_response :success
  end

  test "should update air_route" do
    patch air_route_url(@air_route), params: { air_route: { departure_time: @air_route.departure_time, from: @air_route.from, is_direct: @air_route.is_direct, landing_time: @air_route.landing_time, to: @air_route.to } }
    assert_redirected_to air_route_url(@air_route)
  end

  test "should destroy air_route" do
    assert_difference("AirRoute.count", -1) do
      delete air_route_url(@air_route)
    end

    assert_redirected_to air_routes_url
  end
end

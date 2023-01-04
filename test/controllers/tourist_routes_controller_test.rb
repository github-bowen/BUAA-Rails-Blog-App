require "test_helper"

class TouristRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tourist_route = tourist_routes(:one)
  end

  test "should get index" do
    get tourist_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_tourist_route_url
    assert_response :success
  end

  test "should create tourist_route" do
    assert_difference("TouristRoute.count") do
      post tourist_routes_url, params: { tourist_route: { agency: @tourist_route.agency, cost: @tourist_route.cost, destination: @tourist_route.destination, origin: @tourist_route.origin, total_days: @tourist_route.total_days } }
    end

    assert_redirected_to tourist_route_url(TouristRoute.last)
  end

  test "should show tourist_route" do
    get tourist_route_url(@tourist_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_tourist_route_url(@tourist_route)
    assert_response :success
  end

  test "should update tourist_route" do
    patch tourist_route_url(@tourist_route), params: { tourist_route: { agency: @tourist_route.agency, cost: @tourist_route.cost, destination: @tourist_route.destination, origin: @tourist_route.origin, total_days: @tourist_route.total_days } }
    assert_redirected_to tourist_route_url(@tourist_route)
  end

  test "should destroy tourist_route" do
    assert_difference("TouristRoute.count", -1) do
      delete tourist_route_url(@tourist_route)
    end

    assert_redirected_to tourist_routes_url
  end
end

require "test_helper"

class RoomTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_type = room_types(:one)
  end

  test "should get index" do
    get room_types_url
    assert_response :success
  end

  test "should get new" do
    get new_room_type_url
    assert_response :success
  end

  test "should create room_type" do
    assert_difference("RoomType.count") do
      post room_types_url, params: { room_type: { has_window: @room_type.has_window, name: @room_type.name, price: @room_type.price } }
    end

    assert_redirected_to room_type_url(RoomType.last)
  end

  test "should show room_type" do
    get room_type_url(@room_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_type_url(@room_type)
    assert_response :success
  end

  test "should update room_type" do
    patch room_type_url(@room_type), params: { room_type: { has_window: @room_type.has_window, name: @room_type.name, price: @room_type.price } }
    assert_redirected_to room_type_url(@room_type)
  end

  test "should destroy room_type" do
    assert_difference("RoomType.count", -1) do
      delete room_type_url(@room_type)
    end

    assert_redirected_to room_types_url
  end
end

require "application_system_test_case"

class RoomTypesTest < ApplicationSystemTestCase
  setup do
    @room_type = room_types(:one)
  end

  test "visiting the index" do
    visit room_types_url
    assert_selector "h1", text: "Room types"
  end

  test "should create room type" do
    visit room_types_url
    click_on "New room type"

    check "Has window" if @room_type.has_window
    fill_in "Name", with: @room_type.name
    fill_in "Price", with: @room_type.price
    click_on "Create Room type"

    assert_text "Room type was successfully created"
    click_on "Back"
  end

  test "should update Room type" do
    visit room_type_url(@room_type)
    click_on "Edit this room type", match: :first

    check "Has window" if @room_type.has_window
    fill_in "Name", with: @room_type.name
    fill_in "Price", with: @room_type.price
    click_on "Update Room type"

    assert_text "Room type was successfully updated"
    click_on "Back"
  end

  test "should destroy Room type" do
    visit room_type_url(@room_type)
    click_on "Destroy this room type", match: :first

    assert_text "Room type was successfully destroyed"
  end
end

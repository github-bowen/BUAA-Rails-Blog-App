require "application_system_test_case"

class AirlineCompaniesTest < ApplicationSystemTestCase
  setup do
    @airline_company = airline_companies(:one)
  end

  test "visiting the index" do
    visit airline_companies_url
    assert_selector "h1", text: "Airline companies"
  end

  test "should create airline company" do
    visit airline_companies_url
    click_on "New airline company"

    fill_in "Name", with: @airline_company.name
    click_on "Create Airline company"

    assert_text "Airline company was successfully created"
    click_on "Back"
  end

  test "should update Airline company" do
    visit airline_company_url(@airline_company)
    click_on "Edit this airline company", match: :first

    fill_in "Name", with: @airline_company.name
    click_on "Update Airline company"

    assert_text "Airline company was successfully updated"
    click_on "Back"
  end

  test "should destroy Airline company" do
    visit airline_company_url(@airline_company)
    click_on "Destroy this airline company", match: :first

    assert_text "Airline company was successfully destroyed"
  end
end

require "test_helper"

class AirlineCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @airline_company = airline_companies(:one)
  end

  test "should get index" do
    get airline_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_airline_company_url
    assert_response :success
  end

  test "should create airline_company" do
    assert_difference("AirlineCompany.count") do
      post airline_companies_url, params: { airline_company: { name: @airline_company.name } }
    end

    assert_redirected_to airline_company_url(AirlineCompany.last)
  end

  test "should show airline_company" do
    get airline_company_url(@airline_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_airline_company_url(@airline_company)
    assert_response :success
  end

  test "should update airline_company" do
    patch airline_company_url(@airline_company), params: { airline_company: { name: @airline_company.name } }
    assert_redirected_to airline_company_url(@airline_company)
  end

  test "should destroy airline_company" do
    assert_difference("AirlineCompany.count", -1) do
      delete airline_company_url(@airline_company)
    end

    assert_redirected_to airline_companies_url
  end
end

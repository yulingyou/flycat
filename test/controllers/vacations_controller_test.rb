require "test_helper"

class VacationsControllerTest < 
  ActionDispatch::IntegrationTest 
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:first_user)
    @vacation = vacations(:one)
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get index" do
    get vacations_url
    assert_response :success
  end

  test "should get new" do
    get new_vacation_url
    assert_response :success
  end

  test "should create vacation" do
    assert_difference('Vacation.count') do
      post vacations_url, params: { vacation: {            vacation_type: "事假",
      user_id: 1,
      company_id: 1,
      reason: "",
      vacation_at: "2023-01-20"} }
    end

    assert_redirected_to vacation_url(Vacation.last)
  end

  test "should show vacation" do
    get vacation_url(@vacation)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacation_url(@vacation)
    assert_response :success
  end

  test "should update vacation" do
    patch vacation_url(@vacation), params: { vacation: {  } }
    assert_redirected_to vacation_url(@vacation)
  end

  test "should destroy vacation" do
    assert_difference('Vacation.count', -1) do
      delete vacation_url(@vacation)
    end

    assert_redirected_to vacations_url
  end
end

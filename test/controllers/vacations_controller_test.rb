require "test_helper"

class VacationsControllerTest < 
  ActionDispatch::IntegrationTest 
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:first_user)
    @vacation = Vacation.create!(
      vacation_type: "事假",
      user_id: 1,
      company_id: 1,
      reason: "",
      vacation_at: "2023-01-20"
    )
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
      post vacations_url, params: {
        vacation: {
          vacation_type: "事假",
          user_id: 1,
          company_id: 1,
          reason: "",
          vacation_at: "2023-01-20"
        }
      }
    end
    assert_redirected_to vacation_url(Vacation.last)
  end

  test "should show vacation" do
    # p @vacation
    # p vacation_url(@vacation)
    get vacation_url(@vacation)
    assert_response :success
  end

  test "should not show vacation if that's under different company" do 
    other_vacation = Vacation.create!(
      vacation_type: "事假",
      user_id: 2,
      company_id: 2,
      reason: "",
      vacation_at: "2023-01-20",
    )
    get vacation_url(other_vacation)
    assert_response :missing
  end

  test "should redirect when vacation's status not pending" do
    @vacation.update(status: "approved")
    get edit_vacation_url(@vacation)
    assert_redirected_to vacation_url(@vacation)
  end


  test "should get edit" do
    vacation_pending = Vacation.create!(
      vacation_type: "事假",
      user_id: 1,
      company_id: 1,
      reason: "",
      vacation_at: "2023-01-30",
    )
    get edit_vacation_url(vacation_pending)
    assert_response :success
  end

  test "should update vacation" do
    patch vacation_url(@vacation), params: { vacation: {status: 'pending'} }
    assert_redirected_to vacation_url(@vacation.reload)
  end

  test "should destroy vacation" do
    assert_difference('Vacation.count', -1) do
      delete vacation_url(@vacation)
    end

    assert_redirected_to vacations_url
  end
end

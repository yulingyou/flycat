require "test_helper"

class VacationsFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "FlyCat 人事考勤管理系統"
  end
end

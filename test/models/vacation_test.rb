require "test_helper"
# require "active_record"

class VacationsTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  # test "have one vacation submit" do
    # vacations = Vacation.all
    # assert_not_nil vacations
  # end
  test "find first vacation" do
    assert_equal "", vacations(:first_vacation).vacation_type
  end
end

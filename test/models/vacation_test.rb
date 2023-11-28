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
    assert_equal "病假", vacations(:first_vacation).vacation_type
  end
  test "find first vacation reason" do
    assert_equal "", vacations(:first_vacation).reason
  end

  test "it should return pending status when create the a new vacation" do
    new_vacation = Vacation.create
    assert_equal "pending", new_vacation.status
  end

  test "it should raise an error if the status isn't pending" do
    first_vacation = vacations(:first_vacation)
    exception = assert_raises(Exception) { first_vacation.update!(status: "something_else") }
    assert( exception.message.include?("校驗失敗"))
  end

  # test "find second vacation type error" do
  #   assert_equal nil, vacations(:second_vacation).vacation_type
  # end
end

# testing belongs_to or has_one

#creat different value when "creat"
#test type(controller)
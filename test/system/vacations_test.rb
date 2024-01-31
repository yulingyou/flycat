require "application_system_test_case"

class VacationsTest < ApplicationSystemTestCase
  setup do
    @vacation = vacations(:one)
  end

  test "visiting the index" do
    visit vacations_url
    assert_selector "h1", text: "Vacations"
  end

  test "creating a Vacation" do
    visit vacations_url
    click_on "New Vacation"

    click_on "Create Vacation"

    assert_text "Vacation was successfully created"
    click_on "Back"
  end

  test "updating a Vacation" do
    visit vacations_url
    click_on "Edit", match: :first

    click_on "Update Vacation"

    assert_text "Vacation was successfully updated"
    click_on "Back"
  end

  test "destroying a Vacation" do
    visit vacations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vacation was successfully destroyed"
  end
end

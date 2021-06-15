require "application_system_test_case"

class CourseConnectionsTest < ApplicationSystemTestCase
  setup do
    @course_connection = course_connections(:one)
  end

  test "visiting the index" do
    visit course_connections_url
    assert_selector "h1", text: "Course Connections"
  end

  test "creating a Course connection" do
    visit course_connections_url
    click_on "New Course Connection"

    fill_in "Child course code", with: @course_connection.child_course_code
    fill_in "Parent course code", with: @course_connection.parent_course_code
    fill_in "Required", with: @course_connection.required
    click_on "Create Course connection"

    assert_text "Course connection was successfully created"
    click_on "Back"
  end

  test "updating a Course connection" do
    visit course_connections_url
    click_on "Edit", match: :first

    fill_in "Child course code", with: @course_connection.child_course_code
    fill_in "Parent course code", with: @course_connection.parent_course_code
    fill_in "Required", with: @course_connection.required
    click_on "Update Course connection"

    assert_text "Course connection was successfully updated"
    click_on "Back"
  end

  test "destroying a Course connection" do
    visit course_connections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course connection was successfully destroyed"
  end
end

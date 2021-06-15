require 'test_helper'

class CourseConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_connection = course_connections(:one)
  end

  test "should get index" do
    get course_connections_url
    assert_response :success
  end

  test "should get new" do
    get new_course_connection_url
    assert_response :success
  end

  test "should create course_connection" do
    assert_difference('CourseConnection.count') do
      post course_connections_url, params: { course_connection: { child_course_code: @course_connection.child_course_code, parent_course_code: @course_connection.parent_course_code, required: @course_connection.required } }
    end

    assert_redirected_to course_connection_url(CourseConnection.last)
  end

  test "should show course_connection" do
    get course_connection_url(@course_connection)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_connection_url(@course_connection)
    assert_response :success
  end

  test "should update course_connection" do
    patch course_connection_url(@course_connection), params: { course_connection: { child_course_code: @course_connection.child_course_code, parent_course_code: @course_connection.parent_course_code, required: @course_connection.required } }
    assert_redirected_to course_connection_url(@course_connection)
  end

  test "should destroy course_connection" do
    assert_difference('CourseConnection.count', -1) do
      delete course_connection_url(@course_connection)
    end

    assert_redirected_to course_connections_url
  end
end

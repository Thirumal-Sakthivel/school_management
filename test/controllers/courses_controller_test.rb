require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { active: @course.active, category_id: @course.category_id, course_type: @course.course_type, curriculam: @course.curriculam, description: @course.description, duration: @course.duration, fee: @course.fee, hours_per_day: @course.hours_per_day, learn_content: @course.learn_content, name: @course.name, school_id: @course.school_id } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { active: @course.active, category_id: @course.category_id, course_type: @course.course_type, curriculam: @course.curriculam, description: @course.description, duration: @course.duration, fee: @course.fee, hours_per_day: @course.hours_per_day, learn_content: @course.learn_content, name: @course.name, school_id: @course.school_id } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end

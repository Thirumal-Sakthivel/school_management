require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    check "Active" if @course.active
    fill_in "Category", with: @course.category_id
    fill_in "Course type", with: @course.course_type
    fill_in "Curriculam", with: @course.curriculam
    fill_in "Description", with: @course.description
    fill_in "Duration", with: @course.duration
    fill_in "Fee", with: @course.fee
    fill_in "Hours per day", with: @course.hours_per_day
    fill_in "Learn content", with: @course.learn_content
    fill_in "Name", with: @course.name
    fill_in "School", with: @course.school_id
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    check "Active" if @course.active
    fill_in "Category", with: @course.category_id
    fill_in "Course type", with: @course.course_type
    fill_in "Curriculam", with: @course.curriculam
    fill_in "Description", with: @course.description
    fill_in "Duration", with: @course.duration
    fill_in "Fee", with: @course.fee
    fill_in "Hours per day", with: @course.hours_per_day
    fill_in "Learn content", with: @course.learn_content
    fill_in "Name", with: @course.name
    fill_in "School", with: @course.school_id
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end

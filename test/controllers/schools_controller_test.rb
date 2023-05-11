require "test_helper"

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { active: @school.active, city: @school.city, country: @school.country, delivery_method: @school.delivery_method, description: @school.description, email: @school.email, facilities: @school.facilities, name: @school.name, office_phone: @school.office_phone, phone_number: @school.phone_number, pin_code: @school.pin_code, state: @school.state, street_address: @school.street_address, website: @school.website } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { active: @school.active, city: @school.city, country: @school.country, delivery_method: @school.delivery_method, description: @school.description, email: @school.email, facilities: @school.facilities, name: @school.name, office_phone: @school.office_phone, phone_number: @school.phone_number, pin_code: @school.pin_code, state: @school.state, street_address: @school.street_address, website: @school.website } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end

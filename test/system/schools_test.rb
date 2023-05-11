require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "creating a School" do
    visit schools_url
    click_on "New School"

    check "Active" if @school.active
    fill_in "City", with: @school.city
    fill_in "Country", with: @school.country
    fill_in "Delivery method", with: @school.delivery_method
    fill_in "Description", with: @school.description
    fill_in "Email", with: @school.email
    fill_in "Facilities", with: @school.facilities
    fill_in "Name", with: @school.name
    fill_in "Office phone", with: @school.office_phone
    fill_in "Phone number", with: @school.phone_number
    fill_in "Pin code", with: @school.pin_code
    fill_in "State", with: @school.state
    fill_in "Street address", with: @school.street_address
    fill_in "Website", with: @school.website
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "updating a School" do
    visit schools_url
    click_on "Edit", match: :first

    check "Active" if @school.active
    fill_in "City", with: @school.city
    fill_in "Country", with: @school.country
    fill_in "Delivery method", with: @school.delivery_method
    fill_in "Description", with: @school.description
    fill_in "Email", with: @school.email
    fill_in "Facilities", with: @school.facilities
    fill_in "Name", with: @school.name
    fill_in "Office phone", with: @school.office_phone
    fill_in "Phone number", with: @school.phone_number
    fill_in "Pin code", with: @school.pin_code
    fill_in "State", with: @school.state
    fill_in "Street address", with: @school.street_address
    fill_in "Website", with: @school.website
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "destroying a School" do
    visit schools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "School was successfully destroyed"
  end
end

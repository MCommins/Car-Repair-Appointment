require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @appointment = appointments(:one)
    @user_email = "User@example.com"
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Create Appointment"
  end

  test "creating an Appointment" do
    visit appointments_url

    fill_in "Email Address", with: @user_email
    
    click_on "Submit"

    assert_text "Appointment was successfully created. Check your email to submit appointment details."
    click_on "Back"
  end

  test "updating an Appointment" do
    visit appointments_url
    click_on "Edit", match: :first

    fill_in "Date time", with: @appointment.date_time
    fill_in "First name", with: @appointment.first_name
    fill_in "Last name", with: @appointment.last_name
    fill_in "Make", with: @appointment.make
    fill_in "Model", with: @appointment.model
    fill_in "Repair required", with: @appointment.repair_required
    fill_in "Year", with: @appointment.year
    click_on "Submit Appointment"

    assert_text "Appointment was successfully submitted"
    click_on "Back"
  end

end

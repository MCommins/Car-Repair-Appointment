require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @user_email = "User@example.com"
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Create Appointment"
  end

  test "creating an Appointment" do
    visit appointments_url

    fill_in "appointment_email_address", with: @user_email, visible: false
    
    click_on "Submit"

    assert_text "Appointment was successfully created. Check your email to submit appointment details."
    click_on "Back"
  end

  test "not creating Appointment with invalid email address" do
    visit appointments_url

    fill_in "appointment_email_address", with: "ThisIsNotAnEmailAddress"

    click_on "Submit"

    assert_selector "p", text: "Appointment was successfully created. Check your email to submit appointment details.", count: 0

  end

  test "updating an Appointment" do
    app_one = appointments(:one)

    visit edit_appointment_url(id: app_one.id)

    fill_in "First name", with: app_one.first_name
    fill_in "Last name", with: app_one.last_name
    fill_in "Phone number", with: app_one.phone_number
    fill_in "Year", with: app_one.year
    fill_in "Make", with: app_one.make
    fill_in "Model", with: app_one.model
    fill_in "Repair required", with: app_one.repair_required
    assert_text "Time"
    click_on "Submit Appointment"

    assert_text "Appointment was successfully submitted"
  end

  test "not updating an Appointment with unfilled first_name field" do
    app_unfilled = appointments(:unfilled)
    
    visit edit_appointment_url(app_unfilled.id)

    click_on "Submit Appointment"

    assert_selector "p", text: "Appointment was successfully submitted", count: 0
  end

end

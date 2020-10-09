require 'test_helper'

class AppointmentFlowTest < ActionDispatch::IntegrationTest
	setup do
		ActionMailer::Base.deliveries.clear
		@user_email = "Test@example.com"
	end

  test "create and submit an appointment with an activation email" do
  	get appointments_path
  	assert_difference('Appointment.count', 1) do
  		post appointments_path, params: { email_address: @user_email }
  	end
  	assert_emails 1
  	appointment = Appointment.last

  	assert_not appointment.submitted?

  	get edit_appointment_activation_path("badtoken", @user_email)

  	assert_redirected_to appointments_url

  	get edit_appointment_activation_path(appointment.activation_token, "bademail")

  	assert_redirected_to appointments_url

  	get edit_appointment_activation_path(appointment.activation_token, @user_email)

  	follow_redirect!

  	assert_template "edit"

  	fill_in "First name", with: @app_one.first_name
    fill_in "Last name", with: @app_one.last_name
    fill_in "Phone number", with: @app_one.phone_number
    fill_in "Year", with: @app_one.year
    fill_in "Make", with: @app_one.make
    fill_in "Model", with: @app_one.model
    fill_in "Repair required", with: @app_one.repair_required
    assert_text "Time"
    click_on "Submit Appointment"

    assert_text "Appointment was successfully submitted"

    assert appointment.reload.submitted?

  end
end

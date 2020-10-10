require 'test_helper'

class AppointmentFlowTest < ActionDispatch::IntegrationTest
	setup do
		ActionMailer::Base.deliveries.clear
		@user_email = "Test@example.com"
		@app_one = appointments(:one)
	end

  test "create and submit an appointment with an activation email" do
  	get appointments_path
  	assert_difference('Appointment.count', 1) do
  		post appointments_path, params: { appointment: { email_address: @user_email } }
  	end
  	assert_emails 1
  	appointment = Appointment.last

  	assert_not appointment.submitted?

  	get edit_appointment_activation_path("badtoken", email: @user_email)

  	assert_redirected_to appointments_url

  	get edit_appointment_activation_path(appointment.id, "bademail")

  	assert_redirected_to appointments_url

  	get edit_appointment_activation_path(appointment.id, email: @user_email)

  	follow_redirect!

  	assert_template "appointments/edit"

  	patch appointment_url(appointment), params: { appointment: { phone_number: @app_one.phone_number, date_time: @app_one.date_time, first_name: @app_one.first_name, last_name: @app_one.last_name, make: @app_one.make, model: @app_one.model, repair_required: @app_one.repair_required, year: @app_one.year } }

  	assert_emails 2
    
    assert appointment.reload.submitted?

    assert_redirected_to appointment_url(appointment)

    get edit_appointment_activation_path(appointment.id, email: @user_email)

    assert_redirected_to appointment_url(appointment)

  end
end

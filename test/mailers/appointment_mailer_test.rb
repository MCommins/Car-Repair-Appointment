require 'test_helper'

class AppointmentMailerTest < ActionMailer::TestCase
	setup do
    ActionMailer::Base.deliveries.clear
		@address = 'Test@example.com'
    @app_one = appointments(:one)
	end

	# This should be split up into multiple tests, but having to use 
	# 'deliver_later' to handle multiple emails caused blocking
  test 'can send an activation email to a given email address' do
  	activation = AppointmentMailer.activation_email(email_address: @address, url: "http://localhost:3000/appointment_activations/" + @app_one.id.to_s + "/edit?email=" + @address)

  	assert_emails 1 do
  		activation.deliver_later
  	end

  	assert_equal activation.to, [@address]
    assert_equal activation.from.first, AppointmentMailer.host_email
    assert_equal activation.subject, 'Activation Email'
    assert_match 'This is an Activation email', activation.body.encoded
    assert_match "http://localhost:3000/appointment_activations/" + @app_one.id.to_s + "/edit?email=" + @address, activation.body.encoded
  end

  test 'can send a success email to a given email address' do
   success = AppointmentMailer.success_email(email_address: @address)

    assert_emails 1 do
      success.deliver_later
    end

    assert_equal success.to, [@address]
    assert_equal success.from.first, AppointmentMailer.host_email
    assert_equal success.subject, 'Submission Success Email'
    assert_match 'This is a Success email', success.body.encoded
  end

  test 'can send Car Repair Appointment email with information to repairs@example.com' do
    ip_addr = '0.0.0.0'
    repair_appointment = AppointmentMailer.repair_appointment_email(appointment: @app_one, ip: ip_addr)

    assert_emails 1 do
      repair_appointment.deliver_later
    end

    assert_equal repair_appointment.to, [AppointmentMailer.appointment_receiver_email]
    assert_equal repair_appointment.from.first, AppointmentMailer.host_email
    assert_equal repair_appointment.subject, 'Car Repair Appointment Email'
    assert_match 'First Name: ' + @app_one.first_name, repair_appointment.body.encoded
    assert_match 'Last Name: ' + @app_one.last_name, repair_appointment.body.encoded
    assert_match 'Phone Number: ' + @app_one.first_name, repair_appointment.body.encoded
    assert_match 'Year: ' + @app_one.year.to_s, repair_appointment.body.encoded
    assert_match 'Make: ' + @app_one.make, repair_appointment.body.encoded
    assert_match 'Model: ' + @app_one.model, repair_appointment.body.encoded
    assert_match 'Repair Required: ' + @app_one.repair_required, repair_appointment.body.encoded
    assert_match 'Appointment Time: ' + @app_one.date_time.to_s, repair_appointment.body.encoded
    assert_match 'IP Address: ' + ip_addr, repair_appointment.body.encoded
  end

end
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

end
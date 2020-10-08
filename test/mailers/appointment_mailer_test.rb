require 'test_helper'

class AppointmentMailerTest < ActionMailer::TestCase
	setup do
		@address = 'Test@example.com'
    @app_one = appointments(:one)
	end

	# This should be split up into multiple tests, but having to use 
	# 'deliver_later' to handle multiple emails took too long to run
  test 'can send an activation email to a given email address' do
  	activation = AppointmentMailer.activation_email(email_address: @address, url: "http://localhost:3000/appointments/" + @app_one.id.to_s + "/edit")

  	assert_emails 1 do
  		activation.deliver_later
  	end

  	assert_equal activation.to, [@address]
    assert_equal activation.from.first, AppointmentMailer.host_email
    assert_equal activation.subject, 'Activation Email'
    assert_match 'This is an Activation email', activation.body.encoded
    assert_match "http://localhost:3000/appointments/" + @app_one.id.to_s + "/edit", activation.body.encoded
  end

end
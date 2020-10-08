require 'test_helper'

class AppointmentMailerTest < ActionMailer::TestCase
	setup do
		@address = 'Test@example.com'
	end

	# This should be split up into multiple tests, but having to use 
	# 'deliver_later' to handle multiple emails took too long to run
  test 'can send an activation email to a given email address' do
  	email = AppointmentMailer.activation_email(@address)

  	assert_emails 1 do
  		email.deliver_later
  	end

  	assert_equal email.to, [@address]
  	assert_equal email.from.first, AppointmentMailer.host
  	assert_equal email.subject, 'Activation Email'
  	assert_match 'This is an Activation email', email.body.encoded
  end

end
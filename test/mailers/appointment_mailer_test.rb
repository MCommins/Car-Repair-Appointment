require 'test_helper'

class AppointmentMailerTest < ActionMailer::TestCase
	setup do
		@address = 'Test@example.com'
	end

  test 'can send a activation email to a given email address' do
  	email = AppointmentMailer.activation_email(@address)

  	assert_emails 1 do
  		email.deliver_later
  	end

  	assert_equal email.to, [@address]
  	assert_equal email.subject, 'Activation Email'
  	assert_match 'This is an Activation email', email.body.encoded
  end

end
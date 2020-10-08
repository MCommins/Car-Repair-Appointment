class AppointmentMailer < ApplicationMailer
	@@default_host = 'repairs@example.com'

	default from: @@default_host
	def activation_email(email_address)
		mail(to: email_address, subject: 'Activation Email')
	end

	def self.host
		@@default_host
	end

end

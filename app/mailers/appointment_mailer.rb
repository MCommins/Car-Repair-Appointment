class AppointmentMailer < ApplicationMailer
	@@default_host_email = 'repairs@example.com'
	default from: @@default_host_email

	def activation_email(email_address:, url:)
		@activation_url = url
		mail(to: email_address, subject: 'Activation Email')
	end

	def success_email(email_address:)
		mail(to:email_address, subject: 'Submission Success Email')
	end

	def self.host_email
		@@default_host_email
	end

end

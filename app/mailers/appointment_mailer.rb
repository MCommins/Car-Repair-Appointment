class AppointmentMailer < ApplicationMailer

	def activation_email(email_address)
		mail(to: email_address, subject: 'Activation Email')
	end

end

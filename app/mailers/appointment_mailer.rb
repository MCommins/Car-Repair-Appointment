class AppointmentMailer < ApplicationMailer
	@@default_host_email = 'mailer@example.com'
	@@appointment_receiver_email = 'repairs@example.com'
	default from: @@default_host_email

	def activation_email(email_address:, url:)
		@activation_url = url
		mail(to: email_address, subject: 'Activation Email')
	end

	def success_email(email_address:)
		mail(to: email_address, subject: 'Submission Success Email')
	end

	def repair_appointment_email(appointment:, ip:)
		@appointment = appointment
		@ip = ip
		mail(to: @@appointment_receiver_email, subject: 'Car Repair Appointment Email')
	end

	def self.host_email
		@@default_host_email
	end

	def self.appointment_receiver_email
		@@appointment_receiver_email
	end

end

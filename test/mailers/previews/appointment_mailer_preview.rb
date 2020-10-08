# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
	def activation_email
    email_address = 'Test@example.com'
    AppointmentMailer.activation_email(email_address)
  end
end

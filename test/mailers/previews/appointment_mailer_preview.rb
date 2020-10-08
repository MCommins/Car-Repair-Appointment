# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

	def activation_email
    email_address = 'Test@example.com'
    appointment = Appointment.new
    appointment.save
    AppointmentMailer.activation_email(email_address: email_address, url: "http://localhost:3000/appointments/" + appointment.id.to_s + "/edit")
  end
end

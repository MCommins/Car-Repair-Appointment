# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

	def activation_email
    email_address = 'Test@example.com'
    appointment = Appointment.new(email_address: email_address)
    appointment.save
    AppointmentMailer.activation_email(email_address: email_address, url: "http://localhost:3000/appointment_activations/" + appointment.id.to_s + "/edit?email=" + email_address)
  end
end

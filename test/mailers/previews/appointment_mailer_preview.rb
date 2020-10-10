# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

	def activation_email
    email_address = 'Test@example.com'
    if Appointment.last.nil?
    	appointment = Appointment.new(email_address: email_address)
    	appointment.save
    else
    	appointment = Appointment.last
    end
    AppointmentMailer.activation_email(email_address: email_address, url: "http://localhost:3000/appointment_activations/" + appointment.id.to_s + "/edit?email=" + email_address)
  end

  def success_email
  	AppointmentMailer.success_email(email_address: 'Test@example.com')	
  end

  def repair_appointment_email
  	appointment = Appointment.new(first_name: "Jane", last_name: "Doe", phone_number: "###########", year: "2020", make: "Honda", model: "Civic", repair_required: "Door stuck", date_time: Time.zone.now)
  	AppointmentMailer.repair_appointment_email(appointment: appointment, ip: '0.0.0.0')
  end

end

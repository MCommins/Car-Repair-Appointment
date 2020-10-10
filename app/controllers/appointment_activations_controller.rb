class AppointmentActivationsController < ApplicationController
	# GET /appointments/1/edit
  def edit
  	appointment = Appointment.find_by(id: params[:id], email_address: params[:email])
  	if appointment
  		if appointment.submitted
  			redirect_to appointment_path(appointment)
  		else
  			redirect_to edit_appointment_path(appointment)
  		end
  	else
  		redirect_to appointments_path
  	end
  end

end

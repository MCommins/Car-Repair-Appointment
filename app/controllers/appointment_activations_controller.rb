class AppointmentActivationsController < ApplicationController
	# GET /appointments/1/edit
  def edit
  	appointment = Appointment.find_by(id: params[:id])
  	if appointment && !appointment.submitted?
  		redirect_to edit_appointment_path(appointment)
  	else
  		redirect_to appointments_path
  	end
  end

end

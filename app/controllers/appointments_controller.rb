class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointment = Appointment.new
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    
  end

  # GET /appointments/1/edit
  def edit
    if @appointment.submitted?
      redirect_to appointment_path(@appointment)
    end
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to new_appointment_url }
        format.json { render :show, status: :created, location: @appointment }
        if params[:appointment][:email_address]
          AppointmentMailer.activation_email(email_address: params[:appointment][:email_address], url: build_activation_url).deliver_now
        end
      else
        format.html { render :index }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|

      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
        AppointmentMailer.success_email(email_address: @appointment.email_address).deliver_now
        AppointmentMailer.repair_appointment_email(appointment: @appointment, ip: request.remote_ip).deliver_now

      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
        params.require(:appointment).permit(:first_name, :last_name, :phone_number, :year, :make, :model, :repair_required, :date_time, :email_address)
    end

    def build_activation_url
      edit_appointment_activation_url(@appointment.id, email: params[:email_address])
    end
end

class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      flash[:notice] = "Your appointment has been saved"
      redirect_to appointments_path
    else
      render :new
    end
  end
  private

  def appointment_params
    params.require(:appointment).permit(:dentist_id, :appointment_at)
  end
end

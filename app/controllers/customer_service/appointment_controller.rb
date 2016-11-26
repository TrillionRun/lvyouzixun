class CustomerService::AppointmentController < ApplicationController
  layout 'customer_service_layout'
  def index
    @appointments = Appointment.order('updated_at DESC').page(params[:page]).per(10)
  end

  def show
    @appointment = Appointment.find params[:id]
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create! appointment_params
    redirect_to action: :show, id: @appointment.id if @appointment
  end

  def edit
    @appointment = Appointment.find params[:id]
  end

  def update
    @appointment = Appointment.find params[:id]
    options = params.permit(:status)
    @appointment.update! options
    redirect_to action: :index
  end

  def destroy
  end


  def appointment_params
    params.require(:appointment).permit!
  end
end

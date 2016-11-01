class CustomerService::AppointmentController < ApplicationController
  layout 'customer_service_layout'
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find params[:id]
  end

  def new
  end

  def create
    @appointment = Appointment.create! appointment_params
    redirect_to action: :show, id: @appointment.id if @appointment
  end

  def edit
    @appointment = Appointment.find params[:id]
  end

  def update
  end

  def destroy
  end


  def appointment_params
    params.permit(:user_id, :business_id, :date, :status, :name, :phone, :description)
  end
end

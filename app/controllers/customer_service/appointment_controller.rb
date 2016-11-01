class CustomerService::AppointmentController < ApplicationController
  layout 'customer_service_layout'
  def index
    @appointments = Appointment.all
  end

  def show
    # @appointment = Appointment.find params[:id]
    @appointment = Appointment.joins(:user).joins(:business).
        select('appointments.*, users.name as user_name, businesses.name as business_name').where('appointments.id = ?', params[:id]).first
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
    @appointment = Appointment.find params[:id]
    options = params.permit(:status)
    @appointment.update! options
    redirect_to action: :index
  end

  def destroy
  end


  def appointment_params
    params.permit(:user_id, :business_id, :date, :status, :name, :phone, :description)
  end
end

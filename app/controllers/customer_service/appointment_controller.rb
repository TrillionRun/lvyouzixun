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
  end

  def edit
    @appointment = Appointment.find params[:id]
  end

  def update
  end

  def destroy
  end
end

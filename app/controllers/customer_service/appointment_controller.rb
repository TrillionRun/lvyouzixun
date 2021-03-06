class CustomerService::AppointmentController < ApplicationController
  layout 'customer_service_layout'
  def index
    @appointments = Appointment
    @appointments = @appointments.where('name like :name', name: "%#{params[:name]}%") unless params[:name].blank?
    @appointments = @appointments.order('updated_at DESC').page(params[:page]).per(9)
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

  def finished
    @appointment = Appointment.find params[:id]
    @appointment.update! status: 'finished'
    redirect_to action: :show, id: params[:id]
  end

  def unfinished
    @appointment = Appointment.find params[:id]
    @appointment.update! status: 'active'
    redirect_to action: :show, id: params[:id]
  end

  def destroy
  end


  def appointment_params
    params.require(:appointment).permit!
  end
end

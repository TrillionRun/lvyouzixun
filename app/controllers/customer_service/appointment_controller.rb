class CustomerService::AppointmentController < ApplicationController
  layout 'customer_service_layout'
  def index
    @appointments = Appointment.page(params[:page]).per(10)
  end

  def show
    @appointment = Appointment.find params[:id]
  end

  def new
    array_base = []
    array_tmp = []
    company_types = Business.all
    company_types.each do |company_type|
      array_tmp.push(company_type.name)
      array_tmp.push(company_type.id)
      array_base.push array_tmp
      array_tmp = []
    end
    @businesses = array_base

    array_base_user = []
    array_tmp_user = []
    users = User.all
    users.each do |user|
      array_tmp_user.push(user.name)
      array_tmp_user.push(user.id)
      array_base_user.push array_tmp_user
      array_tmp_user = []
    end
    @users = array_base_user
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

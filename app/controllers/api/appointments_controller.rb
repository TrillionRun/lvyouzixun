class Api::AppointmentsController < Api::AdminApiController
   before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    appointments = Appointment.where('user_id = ?', user.id)
    render json: appointments, status: 200
  end

  def create
    user = User.find(params[:user_id])
    options = appointments_params
    appointment = Appointment.create!(options.merge(user_id: user.id))
    render json: appointment, status: 200
  end

  def update
    user = User.find(params[:user_id])
    appointment = user.appointments.find_by_id params[:id]
    appointment.update_attributes! appointments_params.merge user_id: user.id
    render json: appointment, status: 200
  end

  def appointments_params
    params.permit(:business_id, :date, :status, :name, :phone, :description)
  end
end

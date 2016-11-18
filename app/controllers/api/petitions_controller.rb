class Api::PetitionsController < Api::AdminApiController
  # before_action :authenticate_user!

  def create
    petition = Petition.new petitions_params
    petition.status = 'verifying'
    petition.save!
    render json: petition, status: 200
  end

  def index
    user = User.find(params[:user_id])
    petitions = Petition.where(user_id: user.id)
    render json: petitions, status: 200
  end

  private

  def petitions_params
    columns = [:name, :contact, :contact_phone, :email, :user_id,:company_type_id, :status]
    params.permit(columns)
  end
end
class Api::PetitionsController < Api::AdminApiController
  # before_action :authenticate_user!

  def create
    peti_params = petitions_params.merge company_type_id: get_company_type(params[:company_type]).id
    petition = Petition.new peti_params
    petition.status = 'verifying'
    petition.save!
    petition_json = petition.as_json
    petition_json.merge! company_type: get_company_type(params[:company_type]).name
    render json: petition_json, status: 200
  end

  def index
    user = User.find(params[:user_id])
    petition = Petition.where(user_id: user.id).order("created_at").last
    if petition.present?
      petition_json = petition.as_json
      petition_json.merge! company_type: CompanyType.find_by_id(petition.company_type_id).name
    else
      petition_json = {}
    end
    render json: petition_json, status: 200
  end

  private

  def petitions_params
    columns = [:name, :contact, :contact_phone, :email, :user_id, :status]
    params.permit(columns)
  end

  def get_company_type(company_type)
    ct = CompanyType.find_by name: company_type
    if ct.present?
      ct
    else
      CompanyType.find_by name: 'Other'
    end
  end
end

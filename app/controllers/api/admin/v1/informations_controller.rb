class Api::Admin::V1::InformationsController < Api::Admin::V1::AdminApiController

  def show
    business = Business.find(params[:business_id])
    informations = Information.where('business_id = ?', business.id)
    render json: informations, status: 200
  end
end
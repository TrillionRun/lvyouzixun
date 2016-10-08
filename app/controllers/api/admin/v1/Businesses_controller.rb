class Api::Admin::V1::BusinessesController < Api::Admin::V1::AdminApiController
  def show
    business_id = params[:id]
    business = Business.find_by_id business_id
    render json: business, status: 200
  end

  def get_user_business_info

  end
end
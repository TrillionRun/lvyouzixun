class Api::BusinessesController < Api::AdminApiController
  def show
    business_id = params[:id]
    business = Business.find_by_id business_id
    itineraries = business.itineraries
    informations = business.informations
    business.as_json[0].merge!("itineraries_info" => itineraries.as_json)
    business.as_json[0].merge!("informations_info" => informations.as_json)
    render json: business, status: 200
  end

  def get_user_business_info
  end

  def index
    businesses = Business.all
    render json: businesses, status: 200
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

class Api::BusinessesController < Api::AdminApiController
  def show
    business_id = params[:id]
    business = Business.find_by_id business_id
    business_json = business.as_json
    itineraries = business.itineraries
    informations = business.informations
    picture_url = business.picture.url
    business_json.merge!("itineraries_info" => itineraries.as_json)
    business_json.merge!("informations_info" => informations.as_json)
    business_json.merge!(picture_url: picture_url)
    render json: business_json, status: 200
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

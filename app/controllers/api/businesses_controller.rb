class Api::BusinessesController < Api::AdminApiController
  def show
    business_id = params[:id]
    business = Business.find_by_id business_id
    business_json = business.as_json
    itineraries = business.itineraries
    informations = business.informations
    picture_url = business.picture.url
    its = itineraries.as_json
    its.each do |it|
      it.merge! link: "/public/business/#{business.id}/itinerary/#{it['id']}"
    end
    company_type_name = business.company_type.nil? ? '' : business.company_type.name
    business_json.merge!(company_type_name: company_type_name)
    business_json.merge!(picture_url: ('https:'+picture_url))
    business_json.merge!("itineraries_info" => its)
    business_json.merge!("informations_info" => informations.as_json)
    unless business_json['details'].nil?
      detail = JSON.parse(business_json['details'].to_s)
      business_json.merge!(details: {context_1: detail['context_1'],context_2: detail['context_2']})
    end
    render json: business_json, status: 200
  end

  def get_user_business_info
  end

  def index
    businesses = Business.joins('LEFT OUTER JOIN company_types ON businesses.company_type_id = company_types.id').
        select('businesses.*, company_types.name as company_type_name')
    bjson = businesses.as_json
    bjson.each do |business|
      bu = Business.find_by_id business['id']
      business.merge! picture_url: ('https:'+bu.picture.url)
    end
    render json: bjson, status: 200
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

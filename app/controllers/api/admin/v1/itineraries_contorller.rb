class Api::Admin::V1::ItinerariesController < Api::Admin::V1::AdminApiController
  def show
    business = Business.find(params[:business_id])
    itineraries = Itinerary.where('business_id = ?', business.id)
    render json: itineraries, status: 200
  end
end
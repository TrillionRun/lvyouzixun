class Api::ItinerariesController < Api::AdminApiController
  def show
    business = Business.find(params[:business_id])
    itineraries = Itinerary.where('business_id = ?', business.id)
    render json: itineraries, status: 200
  end

  def index
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

class Api::AdvertisementsController < Api::AdminApiController
  def index
    advertisements = Advertisement.all
    render json: advertisements, status: 200
  end

  def show
    advertisement_id = params[:id]
    advertisement = Advertisement.find_by_id advertisement_id
    render json: advertisement, status: 200
  end
end

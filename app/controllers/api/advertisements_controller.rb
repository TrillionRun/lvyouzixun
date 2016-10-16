class Api::AdvertisementsController < Api::AdminApiController
  def show
    advertisement_id = params[:id]
    advertisement = Business.find_by_id advertisement_id
    render json: advertisement, status: 200
  end
end

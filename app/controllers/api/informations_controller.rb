class Api::InformationsController < Api::AdminApiController

  def index
    business = Business.find(params[:business_id])
    informations = Information.where('business_id = ?', business.id)
    render json: informations, status: 200
  end

  def show
    business = Business.find(params[:business_id])
    information = business.informations.find_by_id params[:id]
    render json: information, status: 200
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

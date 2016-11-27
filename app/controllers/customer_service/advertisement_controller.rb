class CustomerService::AdvertisementController < ApplicationController
  layout 'customer_service_layout'

  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find_by_id params[:id]
  end

  def create
    adparams = advertisement_params
    Advertisement.create! adparams
    redirect_to action: :index
  end

  def new
  end

  def destroy
    @advertisement = Advertisement.find_by_id params[:id]
    @advertisement.destroy!
    redirect_to action: :index
  end

  private

  def advertisement_params
    params.permit(:ad_url, :status, :picture, :protocol)
  end


end

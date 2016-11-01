class CustomerService::AdvertisementController < ApplicationController
  layout 'customer_service_layout'

  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find_by_id params[:id]
  end

  def create
    Advertisement.create! advertisement_params
    redirect_to :index
  end

  def new
  end

  private

  def advertisement_params
    params.permit(:ad_url, :status, :picture, :protocol)
  end


end

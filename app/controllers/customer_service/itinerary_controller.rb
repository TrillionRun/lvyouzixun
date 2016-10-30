class CustomerService::ItineraryController < ApplicationController
  layout 'customer_service_layout'

  def index
    @business = Business.find_by_id params[:business_id]
    @itineraries = @business.itineraries
  end

  def show
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.find_by_id params[:id]
    @daily_plans = @itinerary.daily_plans
  end

  def create
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.create! itinerary_params
    redirect_to customer_service_business_itinerary_path(@business, @itinerary)
  end

  def update
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.find_by_id params[:id]
    @itinerary.update! itinerary_params
    redirect_to customer_service_business_itinerary_path(@business, @itinerary)
  end

  def destroy
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.find_by_id params[:id]
    @itinerary.destroy!
    redirect_to customer_service_business_itinerary_index_path(@business, @itinerary)
  end

  private

  def itinerary_params
    params.permit(:name)
  end
end

class Public::ItineraryController < ApplicationController
  def show
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.find_by_id params[:itinerary_id]
  end
end

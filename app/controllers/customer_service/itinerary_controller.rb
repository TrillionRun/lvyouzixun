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
    @daily_plans.sort do |n1, n2|
      Date.parse(n1.dates) <=> Date.parse(n2.dates) if n1.dates.present? && n1.dates.present?
    end
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
    ActiveRecord::Base.transaction do
      @itinerary.daily_plans.each do |daily_plan|
        daily_plan.destroy!
      end
      @itinerary.destroy!
    end
    redirect_to customer_service_business_itinerary_index_path(@business, @itinerary)
  end

  private

  def itinerary_params
    params.permit(:name)
  end
end

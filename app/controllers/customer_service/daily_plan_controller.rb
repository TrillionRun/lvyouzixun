class CustomerService::DailyPlanController < ApplicationController

  def index
  end

  def show
  end

  def create
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.find_by_id params[:itinerary_id]
    @daily_plan = @itinerary.daily_plans.create! daily_plan_params
    redirect_to customer_service_business_itinerary_path(@business, @itinerary)
  end

  def update
    @business = Business.find_by_id params[:business_id]
    @itinerary = @business.itineraries.find_by_id params[:itinerary_id]
    @daily_plan = @itinerary.daily_plans.update daily_plan_params
    redirect_to customer_service_business_itinerary_path(@business, @itinerary)
  end

  def destroy
    business = Business.find_by_id params[:business_id]
    itinerary = business.itineraries.find_by_id params[:itinerary_id]
    daily_plan = itinerary.daily_plans.find_by_id params[:id]
    daily_plan.destroy!
    redirect_to customer_service_business_itinerary_path(business, itinerary)
  end

  private

  def daily_plan_params
    params.permit(:dates, :places, :description, :food, :hotel, :picture)
  end
end

class AddItineraryToDailyPlan < ActiveRecord::Migration[5.0]
  def change
    add_reference :daily_plans, :itinerary, type: :uuid, index: true
  end
end

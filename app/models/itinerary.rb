class Itinerary < ApplicationRecord

  belongs_to :business
  has_many :daily_plans
end

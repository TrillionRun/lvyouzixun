class Business < ApplicationRecord

  has_many :informations
  has_many :itineraries
end

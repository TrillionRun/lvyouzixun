class Business < ApplicationRecord
  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_many :informations
  has_many :itineraries

  belongs_to :company_type, required: false
end

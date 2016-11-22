class Business < ApplicationRecord
  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_attached_file :video, styles: {
    medium: {geometry: '640x480', format: 'mp4'},
    thumb: {geometry: '100x100#', format: 'jpg', time: 5}
  }, processors: [:transcoder]
  # validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  has_many :informations
  has_many :itineraries
  has_many :conversations
  has_many :appointments
  belongs_to :company_type, required: false

  # process_in_background :video, queue: 'video'
end

class Business < ApplicationRecord
  has_attached_file :picture, {
    medium: "320x240>"
  }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_attached_file :video, styles: {
    medium: {geometry: '640x480', format: 'mp4'},
    thumb: {geometry: '320x240#', format: 'jpg', time: 5}
  }, processors: [:transcoder]
  # validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  has_many :informations
  has_many :itineraries
  has_many :conversations
  has_many :appointments
  belongs_to :company_type, required: false

  # process_in_background :video, queue: 'video'
  def has_unread_message?
    has_unread_message = false
    cons = Conversation.where business_id: self.id
    cons.each do |con|
      if con.read_last_message_id != con.messages.order(:created_at).last.id
        has_unread_message = true
      end
    end
    has_unread_message
  end
end

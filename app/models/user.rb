class User < ApplicationRecord
  has_secure_password

  before_create :generate_authentication_token

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  process_in_background :avatar

  has_many :appointments
  has_many :follows
  has_many :conversations
  has_many :petitions

  def generate_authentication_token
       loop do
         self.authentication_token = SecureRandom.base64(64)
         break if !User.find_by(authentication_token: authentication_token)
       end
  end

  def reset_auth_token!
     generate_authentication_token
     save
  end
end

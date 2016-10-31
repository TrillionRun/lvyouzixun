class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :business
end

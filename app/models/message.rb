class Message < ApplicationRecord
  belongs_to :conversation
  after_create_commit { ChatBroadcastJob.perform_later self }
end

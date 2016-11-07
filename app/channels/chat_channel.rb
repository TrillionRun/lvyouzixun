# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message, sender_id, reciver_id)
    con = Conversation.find_or_create_by!(user_id: reciver_id, business_id: sender_id)
    con.messages.create!({ form_id: sender_id, to_id: reciver_id, content: message })
  end
end

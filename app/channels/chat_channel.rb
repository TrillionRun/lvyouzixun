# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # con = Conversation.find_or_create_by!(user_id: data['reciver_id'], business_id: data['sender_id'])
    # con.update! read_last_message_id: con.messages.order(:created_at).last.id
  end

  def speak(data)
    con = Conversation.find_or_create_by!(user_id: data['reciver_id'], business_id: data['sender_id'])
    con.messages.create!({ from_id: data['sender_id'], to_id: data['reciver_id'], content: data['message'] })
  end

  def read(data)
    con = Conversation.find_by(user_id: data['reciver_id'], business_id: data['sender_id'])
    con.update! read_last_message_id: con.messages.order(:created_at).last.id if con
  end
end

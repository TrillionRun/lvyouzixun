json.array! @conversations do |conversation|
  json.id conversation.id
  json.business_id conversation.business.id
  json.last_message conversation.messages.last.content.to_s
  json.last_message_at conversation.messages.last.created_at
end

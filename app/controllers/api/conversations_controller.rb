class Api::ConversationsController < Api::AdminApiController
  respond_to :json
  def index
    user = User.find_by_id params[:user_id]
    @conversations = user.conversations
    conversation_json = @conversations.as_json
    conversation_json.each do |conversation|
      con = Conversation.find_by_id conversation['id']
      conversation['business_name'] = con.business.name
      conversation['last_message'] = con.messages.last.content.to_s
      conversation['last_message_at'] = con.messages.last.created_at
    end
    render json: conversation_json
  end

  def show
    user = User.find_by_id params[:user_id]
    business = Business.find_by_id params[:business_id]
    conversation = Conversation.find_by user_id: user.id, business_id: business.id
    begin
      start_at = Date.parse params[:start_at].to_s
    rescue ArgumentError
      start_at = Date.parse '1970-01-01'
    end
    render json: (conversation.messages.where("created_at > ?", start_at))
  end
end

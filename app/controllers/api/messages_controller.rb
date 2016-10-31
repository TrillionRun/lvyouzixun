class Api::MessagesController < Api::AdminApiController
  # before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    user = User.find_by_id params[:user_id]
    business = Business.find_by_id params[:business_id]
    conversation = Conversation.find_or_create_by user_id: user.id, business_id: business.id
    conversation.messages.create! from_id: user.id, to_id: business.id, content: params[:content]
    render json: {result: 'true'}, status: 201
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

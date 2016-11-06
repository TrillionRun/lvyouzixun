class Api::FollowsController < Api::AdminApiController
   # before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    follows =  Business.joins('LEFT OUTER JOIN follows ON businesses.id = follows.object_id')
                   .joins('LEFT OUTER JOIN company_types ON businesses.company_type_id = company_types.id')
                   .where('follows.user_id = ?', user.id).
        select('follows.id as follow_id, follows.status as follow_status, businesses.*, company_types.name as company_type_name')
    render json: follows, status: 200
  end

  def create
    user = User.find(params[:user_id])
    options = follows_params
    follow = Follow.create! options.merge user_id: user.id
    render json: {result: true}, status: 201
  end

  def update
    user = User.find(params[:user_id])
    follow = user.follow.find_by_id params[:id]
    follow.update_attributes! follows_params.merge user_id: user.id
    render json: follow, status: 200
  end

  def follows_params
    params.permit(:object_id, :status)
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
    user = User.find(params[:user_id])
    follow = Follow.find_by user_id: user.id, object_id: params[:object_id]
    follow.destroy!
    render json: {result: true}, status: 200
  end
end

class Api::UsersController < Api::AdminApiController

  before_action :authenticate_user!

  def show
    user_id = params[:id]
    user = User.find_by_id user_id
    render json: user, status: 200
  end

  def update
    user = User.find(params[:id])
    authorize user, :update?
    user.update_attributes(user_params)
    render json: user, status: 200
  end

  def update_password
    user_id = params[:id]
    user = User.find_by_id user_id
    authorize user, :update?
    options = params.permit(:password)
    user.update! options
    user.reset_auth_token!
    render json: user, status: 200
  end

  def image

  end

  def send_verification_code

  end

  def create
    options = user_params
    user = User.create! options
    render json: user, status: 200
  end

  def user_params
    columns = [:email, :name, :nickname, :image_url, :last_sign_in,:role, :phone, :status, :password]
    params.permit(columns)
  end
end

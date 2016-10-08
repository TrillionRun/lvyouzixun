class Api::Admin::V1::UsersController < Api::Admin::V1::AdminApiController
  def show
    user_id = params[:id]
    user = User.find_by_id user_id
    render json: user, status: 200
  end

  def update

  end

  def update_password

  end

  def image

  end

  def send_verification_code

  end

  def login

  end
end
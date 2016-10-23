class Api::SessionsController < Api::AdminApiController
  def create
    @user = User.find_by(phone: create_params[:phone])
    if @user && @user.authenticate(create_params[:password])
      render json: {  'token' => @user.authentication_token, 'user_info' => @user}, status: 200
    else
      return api_error(status: 401)
    end
  end

  def destroy
    user = User.find_by_id params[:user_id]
    user.reset_auth_token!
  end

  private

  def create_params
    params.require(:user).permit(:phone, :password)
  end
end

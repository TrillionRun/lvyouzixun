class Api::SessionsController < Api::AdminApiController
  def create
    @user = User.find_by(email: create_params[:email])
    if @user && @user.authenticate(create_params[:password])
      render json: {  'token' => @user.authentication_token}, status: 200
    else
      return api_error(status: 401)
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end

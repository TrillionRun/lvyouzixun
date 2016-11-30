class Api::UsersController < Api::AdminApiController
   # before_action :authenticate_user!, except: [:create]

  def show
    user_id = params[:id]
    user = User.find_by_id user_id
    render json: user, status: 200
  end

  def update
    user = User.find(params[:id])
    # authorize user, :update?
    user.update_attributes(user_params)
    render json: user, status: 200
  end

  def update_password
    user = User.find_by_id params[:user_id]
    unless user.authenticate(params[:current_password])
      render json: { 'message' => 'error: current password is not correct!' }, status: 400
      return
    end

    options = params.permit(:password)
    user.update! options
    user.reset_auth_token!
    render json: user, status: 200
  end

  def update_forgotten_password
    user = User.find_by phone: params[:phone]
    if user.nil?
      render json: {result: 'user doesn\'t exist'}, status: 400
      return
    end
    # unless user.id == params[:user_id]
    #   render json: {result: 'phone doesn\'t match current user'}, status: 400
    #   return
    # end
    code = params[:code]
    op = Code.find_by phone: params[:phone], operation: 'forget_password'
    if op.present? && op.code && op.code == code
      user.update! password: params[:password]
      user.reset_auth_token!
      op.destroy!
      render json: user, status: 200
    else
      render json: {result: 'wrong code'}, status: 400
    end
  end

  def image

  end

  def send_verification_code

  end

  def upload_picture
    user_id = params[:user_id]
    user = User.find_by_id user_id
    # authorize user, :update?
    user.update picture: params[:picture]
    user.reload
    user_json = user.as_json
    picture_url = user.picture.url.nil? ? '' :  ("https:"+user.picture.url)
    user_json.merge! picture_url: picture_url
    render json: user_json, status: 200
  end

  def create
    if User.find_by phone: params[:phone]
      render json: {result: 'phone registered'}, status: 400
      return
    end
    code = params[:code]
    op = Code.find_by phone: params[:phone], operation: 'register'
    if op.present? && op.code && op.code == code
      user = User.create! user_params
      op.destroy!
      render json: user, status: 200
    else
      render json: {result: 'wrong code'}, status: 400
    end
  end

  def code_before_create
    if User.find_by phone: params[:phone]
      render json: {result: 'phone registered'}, status: 400
      return
    end
    op = Code.find_by phone: params[:phone], operation: 'register'
    code = Random.new.rand(1000..9999).to_s
    if op.nil?
      op = Code.create! phone: params[:phone], code: code, operation: 'register'
    else
      op.update! code: code
    end

    send_code(params[:phone], code)

    render json: {result: 'success'}, status: 200
  end

  def code_before_forget_password
    user = User.find_by phone: params[:phone]
    if user.nil?
      render json: {result: 'user doesn\'t exist '}, status: 400
      return
    end
    # unless user.id == params[:user_id]
    #   render json: {result: 'phone doesn\'t match current user'}, status: 400
    #   return
    # end
    code = Random.new.rand(1000..9999).to_s
    op = Code.find_by phone: params[:phone], operation: 'forget_password'
    if op.nil?
      op = Code.create(phone: params[:phone], code: code, operation: 'forget_password')
    else
      op.update! code: code
    end
    send_code(params[:phone], code)
    render json: {result: 'success'}, status: 200
  end

  def business_user
    result = false
    follow = Follow.find_by(user_id: params[:user_id], object_id: params[:business_id])
    if follow.present?
      result = true
    end
    render json:{'result' => result}, status: 200
  end

  def user_params
    columns = [:email, :name, :nickname, :image_url, :last_sign_in,:role, :phone, :password]
    params.permit(columns)
  end
end

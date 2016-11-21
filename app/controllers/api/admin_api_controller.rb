class Api::AdminApiController < ActionController::Base
  include Pundit
  include Taobao

  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  attr_accessor :current_user

  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_error(opts = {})
    render json: {  'message' => 'error '+ opts[:status].to_s }, status: opts[:status]
  end

  def authenticate_userx!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_phone = options.blank?? nil : options[:phone]
    user = user_phone && User.find_by(phone: user_phone)

    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      self.current_user = user
    else
      return unauthenticated!
    end
  end

  def unauthenticated!
    api_error(status: 401)
  end

  def deny_access
    api_error(status: 403)
  end
end

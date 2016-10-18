class CustomerService::HomeController < ApplicationController
  layout 'home_layout'
  def index
    unless service_signed_in?
      redirect_to :new_service_session
    else
      redirect_to :customer_service_users
    end
  end
end

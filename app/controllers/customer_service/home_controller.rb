class CustomerService::HomeController < ApplicationController
  def index
    unless service_signed_in?
      redirect_to :new_service_session
    end
  end
end

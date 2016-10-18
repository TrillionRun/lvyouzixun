class CustomerService::UserController < ApplicationController
  layout 'customer_service_layout'

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:user_id]
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find params[:user_id]
  end

  def update
  end

  def destroy
  end
end

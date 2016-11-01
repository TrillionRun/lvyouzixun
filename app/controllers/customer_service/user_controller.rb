class CustomerService::UserController < ApplicationController
  layout 'customer_service_layout'

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
  end

  def create
    @user = User.create! user_params
    redirect_to action: :show, id: @user.id if @user
  end

  def edit
    @user = User.find params[:id]
  end

  def update
  end

  def destroy
  end

  def user_params
    params.permit(:name, :nickname, :email, :role, :phone, :password, :status )
  end
end

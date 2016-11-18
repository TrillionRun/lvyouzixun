class CustomerService::UserController < ApplicationController
  layout 'customer_service_layout'

  def index
    @users = User.page(params[:page]).per(10)
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
    @user = User.find params[:id]
    if @user.destroy
      redirect_to action: :index
    end
  end

  def user_params
    params.permit(:name, :nickname, :email, :role, :phone, :password, :status )
  end
end

class CustomerService::UserController < ApplicationController
  layout 'customer_service_layout'

  def index
    @users = User
    @users = @users.where('name like :name', name: "%#{params[:name]}%") unless params[:name].blank?
    @users = @users.order('updated_at DESC').page(params[:page]).per(9)
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.password = '123123'
    @user.save!
    redirect_to action: :show, id: @user.id if @user
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      unless @user.password
        @user.password = '123123'
        @user.save!
      end
      redirect_to action: :show, id: @user.id if @user
    else
      render :edit
    end
  end

  def user_follows
    @user = User.find params[:id]
    @follows = @user.follows.page(params[:page]).per(10)
  end

  def user_unfollow
    @user = User.find params[:id]
    @follow = @user.follows.find_by object_id: params[:business_id]
    @follow.destroy if @follow
    redirect_to action: :user_follows
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to action: :index
    end
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :role, :phone, :password, :status, :avatar)
  end
end

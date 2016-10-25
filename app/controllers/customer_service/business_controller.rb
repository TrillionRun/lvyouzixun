class CustomerService::BusinessController < ApplicationController
  layout 'customer_service_layout'
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find params[:id]
  end

  def new
  end

  def create
    @business = Business.create! business_params
    redirect_to action: :show, id: @business.id if @business
  end

  def edit
    @business = Business.find params[:id]
  end

  def post_detail
    @business = Business.find params[:id]
    hash = {}
    hash[:image] = ''
    hash[:context_1] = params[:context_1]
    hash[:context_2] = params[:context_2]
    @business.update! details: hash
  end

  def update
    @business = Business.find params[:id]
    @business.update!(image_params)
    redirect_to action: :show, id: @business.id if @business
  end

  def destroy
  end

  private

  def business_params
    params.permit(:user_id, :name, :picture)
  end

  def image_params
    params.require(:business).permit(:picture)
  end
end

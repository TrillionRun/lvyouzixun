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
  end

  def edit
    @business = Business.find params[:id]
  end

  def update
  end

  def destroy
  end
end

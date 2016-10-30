class CustomerService::PetitionController < ApplicationController
  layout 'customer_service_layout'
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find params[:id]
  end

  def new
  end

  def create
  end

  def edit
    @petition = Petition.find params[:id]
  end

  def update
  end

  def destroy
  end
end

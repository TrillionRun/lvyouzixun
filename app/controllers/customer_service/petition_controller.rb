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
    @petition = Petition.create! petition_params
    redirect_to action: :show, id: @petition.id if @petition
  end

  def edit
    @petition = Petition.find params[:id]
  end

  # def active_petition
  #
  # end

  def update
    @petition = Petition.find params[:id]
    options = params.permit(:status)
    @petition.update! options
    redirect_to action: :index
  end

  def destroy
  end

  def petition_params
    params.permit(:user_id, :name, :contact, :email, :contact_phone, :company_type_id, :status)
  end
end

class CustomerService::PetitionController < ApplicationController
  layout 'customer_service_layout'
  def index
    @petitions = Petition.page(params[:page]).per(10)
  end

  def show
    # @petition = Petition.find params[:id]
    @petition = Petition.joins(:user).joins(:company_type).
        select('petitions.*, users.name as user_name, company_types.description as company_type_name').where('petitions.id = ?', params[:id]).first
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new petition_params
    @petition.status = "verifying"
    @petition.save!
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
    @petition.update! petition_params
    redirect_to action: :index
  end

  def destroy
  end

  def petition_params
    params.require(:petition).permit(:user_id, :name, :contact, :email, :contact_phone, :company_type_id, :status)
  end
end

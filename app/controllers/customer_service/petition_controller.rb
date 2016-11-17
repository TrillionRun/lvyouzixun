class CustomerService::PetitionController < ApplicationController
  layout 'customer_service_layout'
  def index
    @petitions = Petition.all
  end

  def show
    # @petition = Petition.find params[:id]
    @petition = Petition.joins(:user).joins(:company_type).
        select('petitions.*, users.name as user_name, company_types.description as company_type_name').where('petitions.id = ?', params[:id]).first
  end

  def new
    array_base = []
    array_tmp = []
    company_types = CompanyType.all
    company_types.each do |company_type|
      array_tmp.push(company_type.description)
      array_tmp.push(company_type.id)
      array_base.push array_tmp
      array_tmp = []
    end
    @company_types = array_base

    array_base_user = []
    array_tmp_user = []
    users = User.all
    users.each do |user|
      array_tmp_user.push(user.name)
      array_tmp_user.push(user.id)
      array_base_user.push array_tmp_user
      array_tmp_user = []
    end
    @users = array_base_user
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

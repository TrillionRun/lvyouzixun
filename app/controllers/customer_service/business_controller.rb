class CustomerService::BusinessController < ApplicationController
  layout 'customer_service_layout'
  def index
    @businesses = Business
    @businesses = @businesses.where('name like :name', name: "%#{params[:name]}%") unless params[:name].blank?
    @businesses = @businesses.order('updated_at DESC').page(params[:page]).per(10)
  end

  def show
    @company_types = CompanyType.all
    @business = Business.find params[:id]
    begin
      details = @business.details.nil? ? {} : JSON.parse(@business.details)
    rescue
      details = {'context_1': '', 'context_2': ''}
    end
    @context_1 = details['context_1']
    @context_2 = details['context_2']
  end

  def new
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
    @business = Business.create! business_params
    redirect_to action: :show, id: @business.id if @business
  end

  def edit
    @business = Business.find params[:id]
  end

  def post_detail
    @business = Business.find params[:id]
    hash = {}
    hash['context_1'] = params[:context_1]
    hash['context_2'] = params[:context_2]
    @business.update! details: hash.to_json
    redirect_to customer_service_business_path(@business)
  end

  def update
    company_type = CompanyType.find_by_id params[:company_type]
    company_type_id = company_type.nil? ?  '' : company_type.id
    bu_paramters = image_params
    bu_paramters.merge!(company_type_id: company_type_id)
    @business = Business.find params[:id]
    @business.update!(bu_paramters)
    redirect_to action: :show, id: @business.id if @business
  end

  def destroy
  end

  private

  def business_params
    params.permit(:user_id, :name, :picture, :company_name, :phone, :context_1, :context_2)
  end

  def image_params
    params.permit(:user_id, :name,:video, :picture, :company_name, :phone, :context_1, :context_2, :email)
  end
end

class CustomerService::ApplicationRecordController < ApplicationController
  layout 'customer_service_layout'
  def index
    @application_records = ApplicationRecord.all
  end

  def show
    @application_record = ApplicationRecord.find params[:id]
  end

  def new
  end

  def create
  end

  def edit
    @application_record = ApplicationRecord.find params[:id]
  end

  def update
  end

  def destroy
  end
end

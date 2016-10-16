class Api::CompanyTypesController < ApplicationController
  def index
    company_types = CompanyType.all
    render json: company_types, status: 200
  end
end

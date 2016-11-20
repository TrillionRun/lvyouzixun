require 'rails_helper'

RSpec.describe CustomerService::UserController, type: :controller do

  before(:all) do
    @user = FactoryGirl.create :user
  end

  it "get users index" do
    get :index
    expect(response).to render_template :index
  end

  it "get user show" do
    get :show, id: @user
    expect(response).to render_template :show
  end

end
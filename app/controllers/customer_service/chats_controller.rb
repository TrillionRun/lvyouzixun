class CustomerService::ChatsController < ApplicationController
	layout 'customer_service_layout'
	def index
		@business = Business.find_by_id params[:business_id]
    	@users = User.all
	end

	def show_messages
		con = Conversation.find_by(business_id: params[:business_id], user_id: params[:user_id])
		@messages = con.present? ? con.messages : []
		render json: @messages, status: 200
	end
end

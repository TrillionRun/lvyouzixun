class CustomerService::ChatsController < ApplicationController
	layout 'customer_service_layout'
	def index
		@business = Business.find_by_id params[:business_id]
		cons = Conversation.where business_id: @business.id
		@user_collection = []
		cons.each do |con|
			@user_collection << {
				user: con.user,
				has_unread: con.read_last_message_id != con.messages.order(:created_at).last.id
			}
		end
	end

	def show_messages
		con = Conversation.find_by(business_id: params[:business_id], user_id: params[:user_id])
		@messages = con.present? ? con.messages : []
		render json: @messages, status: 200
	end

	def leave_page
		con = Conversation.find_by(business_id: params[:business_id], user_id: params[:user_id])
		con.update! read_last_message_id: con.messages.order(:created_at).last.id
	end
end

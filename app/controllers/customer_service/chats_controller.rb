class CustomerService::ChatsController < ApplicationController
	def index
		@users = User.all
	end

	def show_messages
		business_id = 'c377e25d-9bcf-4cc0-b904-10218f985a49'
		user_id = 'f1e758df-23fe-41a3-8fd8-7af75bcfec90'
		con = Conversation.find_by(business_id: business_id, user_id: user_id)
		@messages = con.messages
	end
end

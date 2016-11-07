class CustomerService::ChatsController < ApplicationController
    def index
        @users = User.all
    end

    def show_message(business_id, user_id)
        con = Conversation.find_by(business_id: business_id, user_id: user_id)
        @messages = con.messages
    end
end

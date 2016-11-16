class ChatBroadcastJob < ActiveJob::Base
	queue_as :default

  def perform(message)
    #广播
    ActionCable.server.broadcast "chat_channel",message: render_message(message)
  end

  private
  def render_message(message)
    "<li class='right'><div class='message-content'>"+ message.content + "</li>".html_safe
    # ApplicationController.renderer.render(partial:'customer_service/messages/message',locals:{message:message})
  end
end
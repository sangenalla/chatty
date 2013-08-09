class ChattyUserController < ApplicationController
      def messages
        @chatty_user = ChattyUser.new(session[:user_email])
        @unread_message_details = @chatty_user.unread_message_details
      end
      def recent_conversation_with
        @chatty_user = ChattyUser.new(session[:user_email])
        @messages_from = params[:messages_from]
        @conversation = @chatty_user.recent_conversation_with(@messages_from)
        render :layout => false
      end
      def send_message
        @chatty_user = ChattyUser.new(session[:user_email])
        @to = params[:to]
        @message_text = params[:message_text]
        Message.create(sent_by: @chat_user_identifier)
        @conversation = @chatty_user.recent_conversation_with(@messages_from)
        render :layout => false
      end
end

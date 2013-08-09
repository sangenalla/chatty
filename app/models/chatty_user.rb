class ChattyUser
  def initialize(chat_user_identifier)
    @user = CHATTY_MODEL_NAME.constantize.send("find_by_#{CHATTY_USER_IDENTIFIER}", chat_user_identifier)
    @chat_user_identifier = chat_user_identifier
  end

  def unread_message_details
    Message.select('sent_by, count(*) as count').where(sent_to: @chat_user_identifier, is_read: false).group(:sent_by)
  end
  def recent_conversation_with(sent_by)
    #TO-DO: Neeed to limit the number of recent conversations
    Message.select('sent_by, text, is_read, created_at').where("(sent_to = '#{@chat_user_identifier}' AND sent_by = '#{sent_by}') OR (sent_to = '#{sent_by}' AND sent_by = '#{@chat_user_identifier}')").order(:created_at)
  end
end

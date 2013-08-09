class ChattyUser
  def initialize(chat_user_identifier)
    @user = CHATTY_MODEL_NAME.constantize.send("find_by_#{CHATTY_USER_IDENTIFIER}", chat_user_identifier)
    @chat_user_identifier = chat_user_identifier
  end

  def unread_message_details
    Message.select('sent_by, count(*) as count').where(sent_to: @chat_user_identifier, is_read: false).group(:sent_by)
  end
end

function getConversationWith(sent_by){
  jQuery.ajax({
    url: '/recent_conversation_with',
    data: {
      messages_from: sent_by
    },
    success : function(data){
      jQuery('#conversation_div').html(data);
    }
  });
}

function send_message_to(send_to){
  var message_text =jQuery('#message_text').val();
  jQuery.ajax({
    url: '/send_message',
    data: {
      send_to: send_to,
      message_text: message_text
    },
    success : function(data){
      jQuery('#conversation_div').html(data);
    }
  });
}

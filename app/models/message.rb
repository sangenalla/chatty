class Message < ActiveRecord::Base
  attr_accessible :is_read, :sent_by, :sent_to, :text
end

class Conversation < ActiveRecord::Base
  attr_accessible :sender_id, :receiver_id, :nsfw

  belongs_to :sender, :class_name => "User"
  belongs_to :reciver, :class_name => "User"
end

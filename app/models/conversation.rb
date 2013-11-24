class Conversation < ActiveRecord::Base
  attr_accessible :sender_id, :receiver_id, :nsfw

  belongs_to :sender, :class_name => "User"
  belongs_to :reciver, :class_name => "User"

  has_one :inverse, :class_name => "Conversation"
  belongs_to :conversation, :foreign_key => :inverse_id, :dependent => :destroy
end

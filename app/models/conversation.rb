class Conversation < ActiveRecord::Base
  attr_accessible :sender_id, :receiver_id, :nsfw
  :after_create :create_inverse

  belongs_to :sender, :class_name => "User"
  belongs_to :reciver, :class_name => "User"

  has_one :inverse, :class_name => "Conversation"
  belongs_to :conversation, :foreign_key => :inverse_id, :dependent => :destroy

  private

  def create_inverse
  	self.inverse = Conversation.create(self.receiver_id, self.sender_id, self.nsfw)
  end
end

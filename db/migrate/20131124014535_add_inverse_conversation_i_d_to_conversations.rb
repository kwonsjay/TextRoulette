class AddInverseConversationIDToConversations < ActiveRecord::Migration
  def change
  	add_column :conversations, :inverse_id, :integer
	end
end

class ApiController < ApplicationController
  def initialize
    account_sid = 'AC17a03fd0e38e057f780d279d04b7704c'
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
  
  def send_text_message(msg, phone)
    # twiml = Twilio::TwiML::Response.new do |r|
    #   r.Sms msg
    # end
    # twiml.text
    
    message = @client.account.messages.create(:body => msg,
        :from => "+17732368398",
        :to => phone)
        
    puts message.to
  end


  def receive_text_message
  	user = User.find_by_phone(params[:phone_number])
  	conversation = Conversation.find_by_phone("WHERE phone1 = ? OR phone2 = ?", user.phone, user.phone)

  	if conversation.present?
  		user_message = params[:message]
  		partner_phone = (user.phone == conversation.phone1) ? conversation.phone2 : conversation.phone1

  		send_text_message(user_message, partner_phone)
  	else
  		make_pair(params)
  	end
  end


  def make_pair(params)
  	user = User.find_by_phone(params[:phone_number])
  	possible_partners = User.all.where("looking_for_pairs = ?", true)
  	partner = possible_partners.sample

  	if partner.present?
  		user.looking_for_pairs = false;
  		partner.looking_for_pairs = false;
  		if user.nsfw && partner.nsfw
  			nsfw = true
  		else
  			nsfw = false
  		end
  		Conversation.create(:phone1 => user.phone, :phone2 => partner.phone, :nsfw => nsfw)
  		send_text_message("partner connected!", user.phone) #partner connected!
  		send_text_message("partner connected!", partner.phone)
  	else
  		send_text_message("no partners available, try again later", user.phone) #no partners available
  	end
  end
    
end

class MessagesController < ApplicationController
	
	def create
	  @message = Message.new(params[:message])
	  if @message.valid?
	    # TODO send message here
	    Messages.new_messages_email(@mailer).deliver
	    redirect_to root_url, notice: "Message sent! Thank you for contacting us."
	  else
	    redirect_to root_url, notice: "Something went wrong, try again!"
	  end
	end

end

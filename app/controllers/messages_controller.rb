class MessagesController < ApplicationController
	
	def create
	  @message = Message.new(message_params)
	  if @message.valid?
	    # TODO send message here
	    Messages.new_messages_email(@message).deliver
	    redirect_to root_url, notice: "Message sent! Thank you for contacting us."
	  else
	    redirect_to root_url, notice: "Something went wrong, try again!"
	  end
	end

	private
    def message_params
      params.require(:message).permit(
        :name, 
        :message,
        :email
      )
    end
end

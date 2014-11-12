class WelcomeController < ApplicationController

  def index
    @message = Message.new
  end

end

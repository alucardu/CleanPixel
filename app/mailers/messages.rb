class Messages < ActionMailer::Base
  default from: "info@domein.nl"

    def new_messages_email(message)

    @message = Message.new
    mail(to: 'peter@no-illusions.nl',
        subject: 'Iemand wilt contact met U')
    end
end

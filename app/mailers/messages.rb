class Messages < ActionMailer::Base
  default from: "info@domein.nl"

    def new_messages_email(mailer)

    @mailer = mailer
    mail(to: 'peter@no-illusions.nl',
        subject: 'Iemand wilt contact met U')
    end
end

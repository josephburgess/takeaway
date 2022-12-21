require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio.env')

class SendSMS
  def initialize(number)
    @number = number
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def message
    message = @client.messages.create(
      body: "Thank you, your order will be with you by #{Time.now + 1800}",
      from: ENV['TWILIO_NUMBER'],
      to: @number
    )

    message.body
  end
end

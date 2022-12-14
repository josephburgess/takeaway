# require 'twilio-ruby'

# # Find your Account SID and Auth Token at twilio.com/console
# # and set the environment variables. See http://twil.io/secure
# account_sid = ENV['x']
# auth_token = ENV['x']
# @client = Twilio::REST::Client.new(account_sid, auth_token)

# message = @client.messages.create(
#   body: 'Thank you for your order',
#   from: '+17262043600',
#   to: '+447769325254'
# )

# puts message.sid

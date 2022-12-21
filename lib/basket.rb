require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio.env')

class Basket
  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = {}
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def add(dish, quantity)
    quantity.times do
      if !@menu.dishes.key?(dish)
        raise 'This is not a valid dish!'
      elsif @order[dish]
        @order[dish] += 1
      else
        @order[dish] = 1
      end
    end
  end

  def contents
    "Your current basket: #{itemize}Total = £#{total}"
  end

  def confirm_order(number)
    message = @client.messages.create(
      body: "Thank you, your order will be with you by #{Time.now + 1800}",
      from: ENV['TWILIO_NUMBER'],
      to: number
    )

    message.body
  end

  private

  def itemize
    items = "\n"

    @order.each do |key, freq|
      items << "#{key} * #{freq} @ £#{format('%.2f', @menu.dishes[key])} \n"
    end
    items
  end

  def total
    total = 0.00
    @order.each do |key, freq|
      total += freq * @menu.dishes[key]
    end
    format '%.2f', total
  end
end

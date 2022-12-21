require 'basket'

describe Basket do
  before(:each) do
    @menu = double :menu, dishes: {
      'Burger' => 6.00,
      'Chips' => 3.00,
      'Pasta' => 5.00,
      'Pizza' => 8.00,
      'Omelette' => 4.00,
      'Bread' => 1.00,
      'Soup' => 2.00
    }
    @basket = Basket.new(@menu)
  end
  context 'adding invalid item' do
    it 'will raise an error' do
      expect { @basket.add('Hot Dog', 3) }.to raise_error 'This is not a valid dish!'
    end
  end
  context 'adding 1 of valid item' do
    it 'will add the item to the basket' do
      @basket.add('Burger', 1)
      expect(@basket.order).to eq({ 'Burger' => 1 })
    end
  end
  context 'adding multiple of valid item' do
    it 'will add the items to the basket' do
      @basket.add('Burger', 3)
      expect(@basket.order).to eq({ 'Burger' => 3 })
    end
  end
  it 'lets users view the current value of their basket' do
    @basket.add('Burger', 2)
    @basket.add('Chips', 2)
    expect(@basket.contents).to eq "Your current basket: \nBurger * 2 @ £6.00 \nChips * 2 @ £3.00 \nTotal = £18.00"
  end
  it 'will send a confirmation SMS of the order' do
    number = ENV['MY_NUMBER']
    expect(@basket.confirm_order(number)).to eq "Sent from your Twilio trial account - Thank you, your order will be with you by #{Time.now + 1800}"
  end
end

require 'basket'
require 'checkout'
require 'dish'
require 'menu'
require 'sms'

RSpec.describe 'Takeaway integration spec' do
  before(:each) do
    @menu = Menu.new
    @basket = Basket.new
    @dish_1 = Dish.new('Burger', 6.00)
    @dish_2 = Dish.new('Chips', 3.00)
    @dish_3 = Dish.new('Pasta', 5.00)
    @dish_4 = Dish.new('Pizza', 8.00)
    @dish_5 = Dish.new('Omelette', 4.00)
    @dish_6 = Dish.new('Bread', 1.00)
  end
  it 'can add dishes to the menu' do
    @menu.add(@dish_1)
    @menu.add(@dish_2)
    expect(@menu.instance_variable_get(:@dishes)).to eq [@dish_1, @dish_2]
  end
  it 'can add X dishes to the basket' do
    @basket.add(@dish_1, 3)
    expect(@basket.instance_variable_get(:@order)).to eq [@dish_1, @dish_1, @dish_1]
  end
  it 'lets users view the current value of their basket' do
    @basket.add(@dish_1, 2)
    @basket.add(@dish_2, 2)
    expect(@basket.contents).to eq "\nBurger @ £6.00 \nBurger @ £6.00 \nChips @ £3.00 \nChips @ £3.00 \nTotal = £18.00"
  end
end

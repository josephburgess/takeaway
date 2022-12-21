require 'basket'
require 'dish'
require 'menu'

RSpec.describe 'Takeaway integration spec' do
  before(:each) do
    @menu = Menu.new
    @basket = Basket.new(@menu)
    @special_1 = Dish.new('Soup', 2.00)
  end
  it 'can add specials to the menu' do
    @menu.add(@special_1)
    expect(@menu.view).to eq({
                               'Burger' => 6.00,
                               'Chips' => 3.00,
                               'Pasta' => 5.00,
                               'Pizza' => 8.00,
                               'Omelette' => 4.00,
                               'Bread' => 1.00,
                               'Soup' => 2.00
                             })
  end
end

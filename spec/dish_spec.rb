require 'dish'

describe Dish do
  before(:each) do
    @dish_1 = Dish.new('Burger', 6)
    @dish_2 = Dish.new('Chips', 3)
    @dish_3 = Dish.new('Pasta', 5)
    @dish_4 = Dish.new('Pizza', 8)
    @dish_5 = Dish.new('Omelette', 4)
    @dish_6 = Dish.new('Bread', 1)
  end
  it 'initializes with name and price' do
    expect(@dish_1.name).to eq 'Burger'
  end
  it 'prints the price when requested' do
    expect(@dish_1.price).to eq 6
  end
  it 'prints the name when requested' do
    expect(@dish_1.name).to eq 'Burger'
  end
end

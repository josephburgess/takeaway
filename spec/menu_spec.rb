require 'menu'

describe Menu do
  before(:each) do
    @menu = Menu.new
  end
  it 'will print the menu when calling view method' do
    expect(@menu.view).to eq({
                               'Burger' => 6.00,
                               'Chips' => 3.00,
                               'Pasta' => 5.00,
                               'Pizza' => 8.00,
                               'Omelette' => 4.00,
                               'Bread' => 1.00
                             })
  end
end

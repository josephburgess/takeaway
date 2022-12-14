require 'menu'

describe Menu do
  before(:each) do
    @menu = Menu.new
  end
  it 'initializes with an empty array for storing menu items' do
    expect(@menu.instance_variable_get(:@dishes)).to eq []
  end
  it 'will print the menu when calling view method' do
    fake_dish = double :dish
    @menu.add(fake_dish)
    expect(@menu.view).to eq [fake_dish]
  end
end

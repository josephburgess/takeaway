class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      'Burger' => 6.00,
      'Chips' => 3.00,
      'Pasta' => 5.00,
      'Pizza' => 8.00,
      'Omelette' => 4.00,
      'Bread' => 1.00
    }

    def add(dish)
      @dishes.store(dish.name, dish.price)
    end

    def view
      @dishes
    end
  end
end

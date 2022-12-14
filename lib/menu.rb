class Menu
  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def view
    @dishes
  end
end

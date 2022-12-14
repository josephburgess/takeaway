class Basket
  def initialize
    @order = []
  end

  def add(dish, quantity)
    quantity.times { @order << dish }
  end

  def contents
    names = "\n"
    total = 0.00
    @order.each do |item|
      names << "#{item.name} @ £#{format('%.2f', item.price)} \n"
      total += item.price
    end
    "#{names}Total = £#{format('%.2f', total)}"
  end

  def confirm_order
    # calls print receipt
    # asks if user wants SMS alert? requests tel number
  end
end

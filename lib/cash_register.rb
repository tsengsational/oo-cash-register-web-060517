require 'pry-byebug'

class CashRegister
attr_accessor :total, :last_item
attr_reader :discount, :items

  def initialize(*discount)
    @total = 0
    @discount = discount.join.to_i if !discount.nil?
    @items = []
    @last_item = {}
  end

  def add_item(title, price, *quantity)
    quantity.size > 0 ? quant = quantity.join.to_i : quant = 1
    @total += (price * quant)
    @last_item[:price] = price
    @last_item[:title] = title
    @last_item[:quantity] = quant
    quant.times do
      @items << title
      # binding.pry
    end
  end

  def apply_discount
    if @discount > 0
      (@total *= ((100.to_f - @discount.to_f)/100.to_f)).to_i
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= (@last_item[:price] * @last_item[:quantity])
    @items.pop(@last_item[:quantity])
  end
end

# Pry.start

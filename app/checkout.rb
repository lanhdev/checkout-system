class Checkout
  def initialize(promotion_rules)
    @basket = Basket.new(promotion_rules)
  end

  def scan(item)
    basket.add_product(item)
  end

  def total
    '£%.2f' % basket.total_price
  end

  attr_reader :basket
end

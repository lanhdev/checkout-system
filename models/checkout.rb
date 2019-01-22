class Checkout
  def initialize(promotion_rules)
    @promotion_rules = promotion_rules
    @basket = Basket.new
  end

  def scan(item)
    basket.add_product(item)
  end

  def total
    '£%.2f' % basket.total_price
  end

  attr_reader :promotion_rules, :basket
end

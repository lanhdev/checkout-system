class Basket
  def initialize(promotion_rules)
    @promotion_rules = promotion_rules
    @products = []
  end

  def add_product(product)
    return unless product.is_a?(Product)
    products.push(product)
  end

  def total_price
    products.reduce(0) { |sum, product| sum + product.price }
  end

  attr_reader :promotion_rules, :products
end

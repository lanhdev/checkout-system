class Checkout
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @products = []
  end

  def scan(code)
    product = Product.new(code)
    products.push(product)
  end

  def total
    '£%.2f' % (total_price - discount)
  end

  private

  attr_reader :promotional_rules, :products

  def total_price
    products.reduce(0) { |sum, product| sum + product.price }
  end

  def discount
    promotions.reduce(0) { |discount, promotion| discount += promotion.apply(products) }
  end

  def promotions
    promotional_rules.sort! { |x, y| x.discount_type <=> y.discount_type }
  end
end

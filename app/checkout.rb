class Checkout
  def initialize(promotions)
    @basket = Basket.new(promotions)
  end

  def scan(code)
    product = Product.new(code)
    basket.add_product(product)
  end

  def total
    '£%.2f' % basket.total
  end

  attr_reader :basket
end

class Basket
  def initialize(promotions)
    @promotions = promotions
    @products = []
  end

  def add_product(product)
    return unless product.is_a?(Product)
    products.push(product)
  end

  def total_price
    products.reduce(0) { |sum, product| sum + product.price }
  end

  attr_reader :promotions, :products
end

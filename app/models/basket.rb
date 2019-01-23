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

  private

  attr_reader :products

  def promotions
    @promotions.sort! { |x, y| x.discount_type <=> y.discount_type }
  end
end

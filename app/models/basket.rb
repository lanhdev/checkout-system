class Basket
  def initialize(promotions)
    @promotions = promotions
    @products = []
  end

  def add_product(product)
    return unless product.is_a?(Product)
    products.push(product)
  end

  def total
    total_price - discount
  end

  private

  attr_reader :products

  def total_price
    products.reduce(0) { |sum, product| sum + product.price }
  end

  def discount
    promotions.reduce(0) { |discount, promotion| discount += promotion.discount }
  end

  def promotions
    @promotions.sort! { |x, y| x.discount_type <=> y.discount_type }
  end
end

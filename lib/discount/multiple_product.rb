
module Discount
  class MultipleProduct
    TYPE = 1
    APPLIED_PRODUCTS = { 'Lavender heart': 8.5 }

    def initialize(products)
      @products = products
    end

    def discount
      return total_price - total_new_price if is_applicable_discount?
      0
    end

    private

    def total_price
      applied_products.reduce(0) { |sum, product| sum + product.price }
    end

    def total_new_price
      applied_products.reduce(0) { |sum, product| sum + APPLIED_PRODUCTS[product.name.to_sym] }
    end

    def is_applicable_discount?
      applied_products.size >= 2
    end

    def applied_products
      @products.select do |product|
        APPLIED_PRODUCTS.keys.map(&:to_s).include?(product.name)
      end
    end
  end
end

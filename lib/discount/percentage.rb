module Discount
  class Percentage
    TYPE = 2

    def initialize(products)
      @products = products
    end

    def discount
      return percentage_off if is_applicable_discount?
      0
    end

    private

    def total_price
      @products.reduce(0) { |sum, product| sum + product.price }
    end

    def is_applicable_discount?
      total_price > 60
    end

    def percentage_off
      (total_price * 10) / 100
    end
  end
end

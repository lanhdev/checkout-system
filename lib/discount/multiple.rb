
module Discount
  class Multiple < Discount::Base
    def discount
      return total_price - total_new_price if is_applicable_discount?
      0
    end

    private

    def total_price
      selected_products.reduce(0) { |sum, product| sum + product.price }
    end

    def total_new_price
      selected_products.reduce(0) { |sum, product| sum + applied_products[product.name.to_sym] }
    end

    def is_applicable_discount?
      selected_products.size >= 2
    end

    def selected_products
      products.select { |product| applied_products.keys.map(&:to_s).include?(product.name) }
    end

    def applied_products
      applied_products = options.fetch(:products, nil)
      raise 'You must send products which will be applied discount' if applied_products.nil?
      applied_products
    end
  end
end

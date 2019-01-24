
module Discount
  class Multiple < Discount::Base
    def initialize(products, options = {})
      @products = products
      @options = options
    end

    def discount
      return total_price_drop if is_applicable_discount?
      0
    end

    private

    attr_reader :products, :options

    def total_price_drop
      total_price_drop = total_price - total_new_price
      apply_new_price
      total_price_drop
    end

    def total_price
      selected_products.reduce(0) { |sum, product| sum + product.price }
    end

    def total_new_price
      selected_products.reduce(0) { |sum, product| sum + discounted_products[product.name.to_sym] }
    end

    def apply_new_price
      selected_products.each do |product|
        product.price = discounted_products[product.name.to_sym]
      end
    end

    def is_applicable_discount?
      selected_products.size >= 2
    end

    def selected_products
      products.select { |product| discounted_products.keys.map(&:to_s).include?(product.name) }
    end

    def discounted_products
      discounted_products = options.fetch(:products, nil)
      raise 'You must send products which will be applied discount' if discounted_products.nil?
      discounted_products
    end
  end
end

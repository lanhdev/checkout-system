module Discount
  class Percentage < Discount::Base
    def initialize(products, options = {})
      @products = products
      @options = options
    end

    def discount
      return percentage_off if is_applicable_discount?
      0
    end

    private

    attr_reader :products, :options

    def total_price
      products.reduce(0) { |sum, product| sum + product.price }
    end

    def is_applicable_discount?
      total_price > threshold
    end

    def percentage_off
      (total_price * percentage) / 100
    end

    def threshold
      threshold = options.fetch(:threshold, nil)
      raise 'You must set a threshold to apply discount' if threshold.nil?
      threshold
    end

    def percentage
      percentage = options.fetch(:percentage, nil)
      raise 'You must set a percentage to apply discount' if percentage.nil?
      percentage
    end
  end
end

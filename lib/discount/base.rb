module Discount
  class Base
    TYPE = { multiple: 1, percentage: 2 }

    def initialize(type, options = {})
      @type = type
      @options = options
    end

    def apply(products)
      if discount_type == 1
        Discount::Multiple.new(products, options).discount
      else
        Discount::Percentage.new(products, options).discount
      end
    end

    def discount_type
      TYPE[type.to_sym]
    end

    private

    attr_reader :type, :options
  end
end

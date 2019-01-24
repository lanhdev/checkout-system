module Discount
  class Base
    TYPE = { multiple: 1, percentage: 2 }

    def initialize(products, type, options = {})
      @products = products
      @type = type
      @options = options
    end

    def discount
      raise 'This method will be implemented in subclasses'
    end

    def discount_type
      TYPE[type.to_sym]
    end

    private

    attr_reader :products, :type, :options
  end
end

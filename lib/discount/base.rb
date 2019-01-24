module Discount
  class Base
    TYPE = { multiple: 1, percentage: 2 }

    def initialize(products, type, code = nil)
      @products = products
      @type = type
      @code = code
    end

    def discount
      raise 'This method will be implemented in subclasses'
    end

    def discount_type
      TYPE[type.to_sym]
    end

    attr_reader :type
  end
end

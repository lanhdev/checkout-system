class Product
  def initialize(code)
    @name = Products::PRODUCTS[code.to_sym][:name]
    @price = Products::PRODUCTS[code.to_sym][:price]
  end

  attr_reader :name, :price
end

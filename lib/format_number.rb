class FormatNumber
  def initialize(number)
    @number = number
  end

  def format_pound
    '£%.2f' % number
  end

  private

  attr_reader :number
end

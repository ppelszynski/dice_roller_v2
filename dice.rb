require_relative './services/numbers_filter'

class Dice
  attr_reader :numbers

  def initialize
    @numbers = generate_numbers
  end

  def roll(numbers = @numbers)
    filtered_numbers = NumbersFilter.call(numbers)

    until sum_valid?(filtered_numbers)
      numbers = generate_numbers
      filtered_numbers = NumbersFilter.call(numbers)
    end

    filtered_numbers
  end

  private

  def generate_numbers
    (1..7).map { rand(1..20) }
  end

  def sum_valid?(numbers)
    numbers.sum >= 55
  end
end
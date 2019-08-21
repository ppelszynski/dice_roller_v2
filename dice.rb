require 'pry'
require_relative './services/neighboring_numbers_filter'
require_relative './services/opposite_numbers_filter'

class Dice
  attr_accessor :numbers
  attr_accessor :random_number

  def initialize
    @random_number = generate_random_number
    @numbers = generate_numbers
  end

  def roll
    filtered_numbers = filter(random_number, numbers)

    until sum_valid?(filtered_numbers)
      numbers = generate_numbers

      filtered_numbers= filter(random_number, numbers)
    end

    additional_roll(filtered_numbers)

    filtered_numbers
  end

  private

  def filter(number, numbers)
    if number == 1
      NeighboringNumbersFilter.call(numbers)
    else
      OppositeNumbersFilter.call(numbers)
    end
  end

  def generate_random_number
    number = nil
    if rand(1..30).between?(1, 7)
      number = rand(1..30)
    end
  end

  def generate_numbers
    (1..7).map { rand(1..20) }
  end

  def sum_valid?(numbers)
    numbers.sum >= 55
  end

  def additional_roll(result)
    result << rand(1..20)
  end
end
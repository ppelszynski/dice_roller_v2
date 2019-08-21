class Dice
  attr_reader :numbers

  def initialize
    @numbers = generate_numbers
  end

  def roll(numbers = @numbers)
    filter_numbers(numbers)
  end

  private

  def generate_numbers
    numbers = (1..7).map { rand(1..20) }
  end

  def filter_numbers(numbers)
    min = numbers.min
    max = numbers.max

    numbers.delete_at(numbers.find_index(min))
    numbers.delete_at(numbers.find_index(max))

    numbers
  end
end
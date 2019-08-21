class OppositeNumbersFilter
  def initialize(numbers)
    @numbers = numbers
  end

  def self.call(numbers)
    filter = new(numbers)
    filter.call
  end

  def call
    filter_numbers(numbers)
  end

  private
  
  attr_reader :numbers

  def filter_numbers(numbers)
    temp_numbers = numbers.clone

    min = temp_numbers.min
    max = temp_numbers.max

    temp_numbers.delete_at(temp_numbers.find_index(min))
    temp_numbers.delete_at(temp_numbers.find_index(max))

    temp_numbers
  end
end

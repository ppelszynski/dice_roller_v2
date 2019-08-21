require 'spec_helper'
require_relative '../../services/opposite_numbers_filter'

describe OppositeNumbersFilter do 
  it 'removes minimal and maximum value' do
    numbers1 = [1, 2, 3, 4, 5, 6, 7]
    numbers2 = [1, 1, 1, 2, 3, 3, 3]

    expect(OppositeNumbersFilter.call(numbers1)).to eq([2, 3, 4, 5, 6])
    expect(OppositeNumbersFilter.call(numbers2)).to eq([1, 1, 2, 3, 3])
  end     
end
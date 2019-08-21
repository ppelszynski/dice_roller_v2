require 'spec_helper'
require_relative '../../services/neighboring_numbers_filter'

describe NeighboringNumbersFilter do 
  it 'removes two lowest values' do
    numbers1 = [1, 1, 1, 2, 3, 4, 5]
    numbers2 = [10, 15, 1, 2, 30, 35, 40]

    expect(NeighboringNumbersFilter.call(numbers1)).to eq([1, 2, 3, 4, 5])
    expect(NeighboringNumbersFilter.call(numbers2)).to eq([10, 15, 30, 35, 40])
  end     
end
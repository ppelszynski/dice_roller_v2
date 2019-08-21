require 'spec_helper'
require_relative '../../services/numbers_filter'

describe NumbersFilter do 
  it 'generates 5 filtered numbers' do
    numbers1 = [1, 2, 3, 4, 5, 6, 7]
    numbers2 = [1, 1, 1, 2, 3, 3, 3]

    expect(NumbersFilter.call(numbers1)).to eq([2, 3, 4, 5, 6])
    expect(NumbersFilter.call(numbers2)).to eq([1, 1, 2, 3, 3])
  end     
end
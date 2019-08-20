require 'spec_helper'
require_relative '../dice'

describe Dice do 
  it 'generates 5 filtered numbers' do
    numbers1 = [1, 2, 3, 4, 5, 6, 7]
    numbers2 = [1, 1, 1, 2, 3, 3, 3]
    dice = Dice.new

    expect(dice.roll(numbers1)).to eq([2, 3, 4, 5, 6])
    expect(dice.roll(numbers2)).to eq([1, 1, 2, 3, 3])
  end     
end
require 'spec_helper'
require_relative '../dice'

describe Dice do 
  it 'generates 5 filtered numbers' do
    dice = Dice.new

    expect(dice.roll.length).to eq(5)
    expect(dice.numbers.length).to eq(7)
  end     

  it 'filters numbers with sum equal 55' do
    dice = Dice.new
    numbers = [1, 5, 10, 10, 15, 15, 19]

    expect(dice.roll(numbers)).to eq([5, 10, 10, 15, 15])
  end     

  it 'rerolls when sum less than 55' do
    dice = Dice.new
    numbers = [0, 0, 0, 0, 0, 0, 0]

    expect(dice.roll(numbers)).not_to eq([0, 0, 0, 0, 0])
    expect(dice.roll(numbers).length).to eq(5)
  end     
end
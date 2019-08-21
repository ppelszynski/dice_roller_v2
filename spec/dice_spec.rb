require 'spec_helper'
require_relative '../dice'

describe Dice do 
  it 'generates 6 numbers' do
    dice = Dice.new

    expect(dice.roll.length).to eq(6)
    expect(dice.numbers.length).to eq(7)
  end     

  it 'passes and filters numbers with sum equal 55' do
    dice = Dice.new
    numbers = [1, 5, 10, 10, 15, 15, 19]

    expect(dice.roll(numbers).first(5)).to eq([5, 10, 10, 15, 15])
  end     

  it 'rerolls when sum less than 55' do
    dice = Dice.new
    numbers = [0, 0, 0, 0, 0, 0, 0]

    expect(dice.roll(numbers).first(5)).not_to eq([0, 0, 0, 0, 0])
    expect(dice.roll(numbers).length).to eq(6)
  end     

  it 'adds additional roll' do
    dice = Dice.new
    numbers = [20, 20, 20, 20, 20, 20, 20]

    expect(dice.roll(numbers).first(5)).to eq([20, 20, 20, 20, 20])
    30.times do
      expect(dice.roll(numbers).last).to be_between(1, 30)
    end
  end     
end
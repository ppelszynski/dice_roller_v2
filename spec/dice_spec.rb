require 'spec_helper'
require_relative '../dice'
require 'pry'

describe Dice do 
  it 'generates 6 numbers' do
    dice = Dice.new

    expect(dice.roll.length).to eq(6)
    expect(dice.numbers.length).to eq(7)
  end     

  it 'passes and filters numbers with sum equal 55' do
    dice = Dice.new
    dice.numbers = [1, 5, 10, 10, 15, 15, 19]

    expect(dice.roll.first(5)).to eq([5, 10, 10, 15, 15])
  end     

  it 'rerolls when sum less than 55' do
    dice = Dice.new
    dice.numbers = [0, 0, 0, 0, 0, 0, 0]

    expect(dice.roll.first(5)).not_to eq([0, 0, 0, 0, 0])
    expect(dice.roll.length).to eq(6)
  end     

  it 'adds additional roll' do
    dice = Dice.new
    dice.numbers = [20, 20, 20, 20, 20, 20, 20]

    expect(dice.roll.first(5)).to eq([20, 20, 20, 20, 20])
    20.times do
      expect(dice.roll.last).to be_between(1, 20)
    end
  end

  it 'excludes two lowest values when random number equals 1' do
    dice = Dice.new
    dice.numbers = [10, 10, 20, 20, 20, 20, 20]
    dice.random_number = 1

    expect(dice.roll.first(5)).to eq([20, 20, 20, 20, 20])
  end     

  it 'excludes minimum and maximum value when random number is other than 1' do
    dice = Dice.new
    dice.random_number = 55
    dice.numbers = [10, 20, 20, 20, 20, 20, 30]

    expect(dice.roll.first(5)).to eq([20, 20, 20, 20, 20])
  end     

  it 'fixes additional roll when random number is in desired range' do
    dice = Dice.new
    dice.random_number = 25
    dice.numbers = [10, 20, 20, 20, 20, 20, 30]

    expect(dice.roll.last).to eq(25)
  end

  it 'performs additional roll when random number is in specific range' do
    dice = Dice.new
    dice.random_number = 10
    dice.numbers = [10, 20, 20, 20, 20, 20, 30]

    20.times do
      expect(dice.roll.last).to be_between(1, 20)
    end

    dice.random_number = 50

    20.times do
      expect(dice.roll.last).to be_between(1, 20)
    end
  end     
end
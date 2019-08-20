require 'spec_helper'
require_relative '../dice'

describe Dice do 
  it 'generates number from specified range' do
    dice = Dice.new

    20.times do 
      expect(dice.roll).to be_between(1, 20)
    end
  end     
end
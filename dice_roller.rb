require_relative './dice'

dice = Dice.new

def prompt(answer = nil, dice)
  return if answer == 'YES!'

  puts "Your randomly generated set: #{dice.roll}. Are you happy?"
  answer = gets.chomp
  prompt(answer, dice)
end

prompt(dice)
require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# ... below my requires

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

#visited root url/homepage
#execute hello world 
get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  num1 = rand(1..6)
  num2 = rand(1..6)

  sum = num1 + num2

  

  @outcome = "You rolled a #{num1} and a #{num2} for a total of #{sum}."
  
  erb(:two_six)
end

get("/dice/2/10") do
  num1 = rand(1..10)
  num2 = rand(1..10)

  sum = num1 + num2

  @outcome = "You rolled a #{num1} and a #{num2} for a total of #{sum}."

  erb(:two_ten)
end

get("/dice/1/20") do
  @num1 = rand(1..20)

  @outcome = "You rolled a #{@num1}."

  erb(:one_twenty)
end

get("/dice/5/4") do
  num1 = rand(1..4)
  num2= rand(1..4)
  num3 = rand(1..4)
  num4 = rand(1..4)
  num5 = rand(1..4)

  sum = num1 +num2+num3+num4+num5

  @outcome = "You rolled a #{num1}, #{num2}, #{num3}, #{num4}, and a #{num5} for a total of #{sum}."

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end

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
   @rolls = []    # Create a blank array

  2.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end
  
  erb(:two_six)
end

get("/dice/2/10") do
   @rolls = []    # Create a blank array

  2.times do    # 100 times...
    die = rand(1..10)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = rand(1..20)    # Generate a random number

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []    # Create a blank array

  5.times do    # 100 times...
    die = rand(1..4)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

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

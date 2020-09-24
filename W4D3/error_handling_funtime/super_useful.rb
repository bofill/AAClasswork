class NotAFruitError < StandardError
end

class CoffeeError < StandardError
end

# PHASE 2
def convert_to_int(str)
  begin
    Integer(str) # "five" "5"
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase != "coffee" 
    raise NotAFruitError.new("Not a valid Fruit") 
  else
    raise CoffeeError.new("Coffee is good, but try again!")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue NotAFruitError, CoffeeError => e
    puts e.message
    retry if e.class == CoffeeError
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    unless yrs_known >= 5
      raise "Sorry, lets use the time machine!"
    end
    if name.length <= 0 || fav_pastime.length <= 0
      raise "Sorry, I'm not a mind reader! What's your name and pastime?"
    end
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
    # puts ?😄.ord  
    # puts 97.chr
    puts ?♞.ord
    puts [9820].pack("U*")
    puts [9822].pack("U*")
    # puts [128516].pack("U*")
    # puts [128516].pack("U*")
    # puts [128516].pack("U*")
    
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end



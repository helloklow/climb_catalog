class ClimbCatalog::CLI
  
  def call
    puts "Welcome to the Top International Climbing Destinations!"
    menu
  end
  
  def menu
    puts "What type of climbing are you interested in?" 
    puts "Please enter boulder, sport, or trad."
    input = gets.strip.downcase
    print_climbs(input) # prints list of five boulder, sport, or trad climbs
  
    puts "Which destination would you like beta for?"
    input = gets.strip.downcase
    climb = ClimbCatalog::Climb.find(input.to_i) # program finds correct destination by name OR index??
    print.climb(climb)
    
    choose_more
  end
    
  def choose_more
    puts "Would you like to choose another destination? yes / no"
    input = gets.strip.downcase
    if input == "yes"
      menu
    elsif input == "no"
      goodbye
    else
      puts "Sorry, I don't understand."
      choose_more
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
  #def print_climbs(type) # how do I pass in the type??
    #puts "#{type.capitalize} climbs in Fort Collins:"
    #puts ""
    #ClimbCatalog::Climb.all.each do |climb, index|
      #puts "#{index}. #{climb.name}, #{climb.location}"
    #end
  #end

end
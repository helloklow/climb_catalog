class ClimbCatalog::CLI
  
  def call
   #ClimbCatalog::Climb.new.create_climbs
    puts "Welcome, climber!" 
    climb_type
  end
  
  def climb_type
    puts "What type of climb are you interested in? Please enter boulder, sport, or trad."
    input = gets.strip.downcase
    
    print_climbs(input) # program lists climbs of type
  
    choose_climb
  end
  
  def choose_climb
    puts "Which climb would you like beta for?"
    input = gets.strip.downcase
    # program finds correct climb by name or index??
    #climb = ClimbCatalog::Climb.find(input.to_i) # should this be to_i in my case?
    if input != nil
      puts "ALL the info on your climb!"
    else
      puts "Sorry, which climb?"
    end
    #print_climb(climb) # program returns details for climb
 
    choose_more
  end
   
   def choose_more 
    puts "Would you like to choose another climb? yes / no"
     input = gets.strip.downcase
    if input == "yes"
      climb_type
    elsif input == "no"
      goodbye
    else
      puts "Sorry, I don't understand. Please enter yes or no."
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
  
  #def print_climb(climb)
    
  #end
  
end
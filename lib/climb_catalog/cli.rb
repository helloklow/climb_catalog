class ClimbCatalog::CLI
  
  def call
   #ClimbCatalog::Climb.new.create_climbs
    puts "Welcome, climber!" 
    menu
  end
  
  def menu
    puts "Are you interested in boulder, sport, or trad climbs today?"
    input = gets.strip.downcase
    print_climbs(input) # program lists climbs of type
    
    puts "Which climb would you like beta for?"
    input = gets.strip.downcase
    # program goes to correct climb
    #climb = ClimbCatalog::Climb.find(input.to_i) # should this be to_i in my case?
    if input != nil
      puts "ALL the info on your climb!"
    else
      puts "Sorry, which climb?"
    end
    #print_climb(climb) # program returns details for climb
    
    puts "Would you like to choose another climb? yes / no"
     input = gets.strip.downcase
    if input == "yes"
      menu
    elsif input == "no"
      goodbye
    else
      puts "Sorry, I don't understand. Please enter yes, no, or exit."
      menu
    end
  end
  
  def print_climbs(type) # how do I pass in the type??
    puts "#{type.capitalize} climbs in Fort Collins:"
    puts ""
    ClimbCatalog::Climb.all.each do |climb, index|
      puts "#{index}. #{climb.name}, #{climb.location}"
    end
  end
  
  def print_climb(climb)
    
  end
  
  def goodbye
    puts "Climb on!"
  end
end
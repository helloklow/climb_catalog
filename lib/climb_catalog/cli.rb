class ClimbCatalog::CLI
  
  def call
    puts "Welcome, climber!" 
    menu
  end
  
  def menu
    puts "Which U.S. state will you be climbing in?"
    input = gets.strip.downcase
    
    puts "Are you interested in boulder, sport, or trad climbs?"
    input = gets.strip.downcase
    
    print_climbs(input)
    
    puts "Which climb would you like beta for?"
    input = gets.strip.downcase
    
    climb = ClimbCatalog::Climb.find(input.to_i) # should this be to_i in my case?
    print_climb(climb)
    
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
  
end
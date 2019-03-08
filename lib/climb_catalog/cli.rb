class ClimbCatalog::CLI
  
  def call
    puts "Welcome, climber!" 
    menu
  end
  
  def menu
    puts "Which U.S. state will you be climbing in?"
    input = gets.strip.downcase
    # program goes to correct state
    
    puts "Are you interested in boulder, sport, or trad climbs?"
    input = gets.strip.downcase
    # program collects correct type of climb
    # print_climbs(input) # program lists climbs of type
    if input == "boulder"
      puts "boulder1, boulder2, boulder3"
    elsif input == "sport"
      puts "sport1, sport2, sport3"
    elsif input == "trad"
      puts "trad1, trad2, trad3"
    else
      puts "Sorry, I don't understand. Please enter a type of climb or exit."
    end
    
    puts "Which climb would you like beta for?"
    input = gets.strip.downcase
    # program goes to correct climb
    #climb = ClimbCatalog::Climb.find(input.to_i) # should this be to_i in my case?
    if input != nil
      puts "aaaaaaaalllllllllllllllll the info on your climb!"
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
    puts "#{type} climbs in #{scrape_location}:"
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
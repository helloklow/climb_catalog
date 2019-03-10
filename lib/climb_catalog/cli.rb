class ClimbCatalog::CLI
  
  def call
    ClimbCatalog::Scraper.new.make_destinations
    puts "Welcome to the Top International Climbing Destinations!"
    menu
  end
  
  def menu
    puts "What type of climbing are you interested in?" 
    puts "Please enter boulder, sport, or trad."
    input = gets.strip.downcase
    print_destinations(input) # prints list of five boulder, sport, or trad climbs
  
    puts "Which destination would you like beta for?"
    input = gets.strip.downcase
    climb = ClimbCatalog::Climb.find(input.to_i) # program finds correct destination by name OR index??
    print_destination(location)
    
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
  
  def print_destinations(by_type)
    puts "Top #{type.capitalize} Climbing Destinations:"
    ClimbCatalog::Climb.all.each.with_index(by_type) do |climb, index|
      puts "#{index}. #{climb.location}"
    end
  end
  
  def print_destination(location)
    puts "#{location}"
    puts "#{location.description}"
  end

end
class ClimbCatalog::CLI
  
  def call
    ClimbCatalog::Scraper.new.make_destinations # scrapes and instantiates all destinations from webpage, save to destination class
    puts "Welcome to the Top International Climbing Destinations!"
    menu
  end
  
  def menu
    puts "What type of climbing are you interested in?" 
    puts "Please enter Trad Climbing, Sport Climbing, or Bouldering."
    input = gets.strip.capitalize # user inputs climb type
    
    list_destinations_by_type(input) # this method sorts, then prints list of five boulder, sport, or trad destinations
    
    puts "Which destination would you like beta for?"
    input = gets.strip.capitalize # user inputs destination name
    
    print_destination(input) # program finds correct destination instance and prints details
    
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
  
  #def print_destinations(by_type)
    #puts "Top #{type.capitalize} Climbing Destinations:"
    #puts "#{index+1}. #{climb.location}, #{climb.type}"
    #ClimbCatalog::Destination.all.select do |type|
  #end
  
  def print_destination(name)
    puts "#{name}:"
    puts "#{name.description}" # .description method returns destination description
  end

end
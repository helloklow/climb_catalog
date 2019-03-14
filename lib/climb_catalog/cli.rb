class ClimbCatalog::CLI
  attr_accessor :type
  
  @@type = nil
  
  def call
    #ClimbCatalog::Scraper.new.make_destinations # scrapes and instantiates all destinations from webpage, save to destination class
    puts "Welcome to the Top International Climbing Destinations!"
    puts "What type of climbing are you interested in?" 
    puts "Please enter Trad Climbing, Sport Climbing, or Bouldering."
    type
    ClimbCatalog::Scraper.scrape_destinations(@@type)
    list_destinations
    menu
  end
  
  def type
    @@type = gets.strip
  end
  
  def list_destinations
    puts "Top #{destination.type.capitalize} Climbing Destinations:"
    ClimbCatalog::Destination.list_by_type.each.with_index(1) do |destination, i|
      puts "#{i}. #{destination.name} - #{destination.type}"
    end
  end
  
  def menu
    #puts "What type of climbing are you interested in?" 
    #puts "Please enter Trad Climbing, Sport Climbing, or Bouldering."
    #input = gets.strip.capitalize # user inputs climb type
    
    #print_destinations(input) # this method sorts, then prints list of five boulder, sport, or trad destinations
    input = nil
    while input != "exit"
      puts "Which destination would you like beta for?"
      input = gets.strip.capitalize # user inputs destination name
      
      if input.to_i > 0 && input.to_i <= ClimbCatalog::Destination.list_by_type.size 
        user_destination = ClimbCatalog::Destination.list_by_type[input.to_i-1]
        puts "#{user_destination.name} - #{user_destination.type}"
        puts "#{user_destination.description}"
      elsif input == "menu"
        call
      else
        puts "Sorry, invalid command. Please type menu or exit." unless input == "exit"
      end
    end
    #print_destination(input) # program finds correct destination instance and prints details
    
    #choose_more
  end
    
  #def choose_more
   # puts "Would you like to choose another destination? yes / no"
    #input = gets.strip.downcase
    #if input == "yes"
     # menu
   # elsif input == "no"
    #  goodbye
   # else
      #puts "Sorry, I don't understand."
      #choose_more
   # end
  #end
  
  def goodbye
    puts "Climb on!"
  end
  
  #def print_destinations(type)
   # ClimbCatalog::Destination.all.select do |destination| 
     # if destination == destination.type
       # puts "Top #{destination.type.capitalize} Climbing Destinations:"
       # puts "#{index+1}. #{destination.name}, #{destination.type}"
      #end
   # end
 # end
  
 # def print_destination(name)
   # puts "#{name}:"
   # puts "#{name.description}"
 # end

end
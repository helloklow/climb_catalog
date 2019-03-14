class ClimbCatalog::CLI

  def call
    ClimbCatalog::Scraper.new.create_destinations 
    puts "Welcome to the Top International Climbing Destinations!"
    menu
  end
  
  def menu
    #puts "What type of climbing are you interested in?" 
    #puts "Please enter Trad Climbing, Sport Climbing, or Bouldering."
    #input = gets.strip.capitalize # user inputs climb type
    puts "" 
    puts "Here are the 15 most popular climbing destinations in the world"
    
    list_destinations
    
    puts ""
    puts "Which destination would you like to learn more about?"
    input = gets.strip
    destination = ClimbCatalog::Destination.find(input.to_i)
    
    print_destination(destination)
    
    puts "Would you like to choose another destination? yes / no"
    input = gets.strip.downcase
    if input == "yes"
      menu
    elsif input == "no"
      goodbye
    else
      puts "Sorry, I don't understand."
      menu
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
  def list_destinations
    puts "Top #{destination.type.capitalize} Climbing Destinations:"
    ClimbCatalog::Destination.all.each.with_index(1) do |destination, i|
      puts "#{i}. #{destination.name} - #{destination.type}"
    end
  end
  
  def print_destination(destination)
    puts "#{destination}:"
    puts "#{destination.type} - #{destination.description}"
  end

end
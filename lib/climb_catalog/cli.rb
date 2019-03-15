class ClimbCatalog::CLI

  def call
    ClimbCatalog::Scraper.new.scrape_destinations
    puts "Welcome to the Top International Climbing Destinations!"
    puts ""
    menu
  end

  def menu
    puts "We've found 15 of the most iconic worldwide climbing destinations:"
    list_destinations
    
    puts "Enter the number of the destination you would like to learn more about:"
    input = gets.strip.to_i

    d = ClimbCatalog::Destination.find(input)

    print_destination(d)
    
    puts "Would you like to select another destination? (Y / N)"
    input = gets.strip.downcase
    
    if input == "y"
      menu
    elsif input == "n"
      goodbye
    else
      puts ""
      puts "I'm sorry, I don't understand."
      puts ""
      menu
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
  def list_destinations
    ClimbCatalog::Destination.all.each do |d|
      puts "#{d.name} - #{d.type}"
      puts ""
    end
  end

  def print_destination(d)
    puts ""
    puts "#{destination.name} - #{destination.type}"
    puts "#{destination.description}"
    puts ""
  end

end
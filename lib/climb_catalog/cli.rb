class ClimbCatalog::CLI

  def call
    ClimbCatalog::Scraper.get_climbs
    ClimbCatalog::Scraper.create_climbs
    puts ""
    puts "===== Welcome, Colorado Climber! ====="
    select_type
  end

  def select_type
    puts ""
    puts "We've located the following types of climbing in your area:"
    ClimbCatalog::Climb.all.each do |c, i|
      puts "#{i}. #{c.type}"
    end
    puts ""
    puts "Please enter the number you would like to see climbing routes for:"
    puts "Enter 'list' to see types again or 'exit' to quit."
    
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
      if input == "list"
        menu
      elsif input.to_i.between?(0, ClimbCatalog::Climb.all.size) # if user selects a type by number
        the_climbs = ClimbCatalog::Climb.find(input) # find climbs of that type
        puts "#{the_climbs.name} at #{the_climbs.location}"
      else
        puts "Sorry, I don't understand."
      end
    end
  end
  
  def select_climb
    puts ""
    puts "Enter the name of the route you would like beta for:"
    
    input = nil 
    while input != "exit"
    input = gets.strip.capitalize
      if input == "list"
        menu
      elsif input == ClimbCatalog::Climb.find(input)
        puts "The climb's URL" # should actually send the user to the URL in their browser
      else
        puts "Sorry, I don't understand."
      end
    end
  end
  
  def goodbye
    puts ""
    puts "===== Climb on! ====="
  end

end

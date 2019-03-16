class ClimbCatalog::CLI

  def call
    ClimbCatalog::Scraper.get_climbs
    ClimbCatalog::Scraper.create_climbs
    puts ""
    puts "===== Welcome, Colorado Climber! ====="
    puts ""
    puts "We're here to share Mountain Project's classic climbs for Northern Colorado!"
    puts "You may enter 'list' to see types again or 'exit' to quit at any time."
    select_type
  end

  def select_type
    puts ""
    puts "What type of climbing are you interested in today?"
    puts "Enter 'boulder', 'sport', or 'trad':"
    
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
      if input == "list"
        select_type
      elsif input == "boulder"
        ClimbCatalog::Climb.show_boulders
        select_climb
      elsif input == "sport"
        ClimbCatalog::Climb.show_sport
        select_climb
      elsif input == "trad"
        ClimbCatalog::Climb.show_trad
        select_climb
      elsif input == "exit"
        goodbye
      else
        puts "Sorry, I don't understand."
        select_type
      end
    end
  end
  
  def select_climb
    puts ""
    puts "Enter the name of the route you would like beta for:"
    
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
      if input == "list"
        select_type
      elsif input == ClimbCatalog::Climb.find(input) # be sure to downcase the climb names in this method!!!
        puts "The climb's URL" # will actually send the user to the URL in their browser!!!
      elsif input == "exit"
        goodbye
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

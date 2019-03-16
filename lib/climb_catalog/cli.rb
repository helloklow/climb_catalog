class ClimbCatalog::CLI

  def call
    ClimbCatalog::Climb.get_climbs
    puts ""
    puts "===== Welcome, Colorado Climber! ====="
    puts ""
    puts "We're here to share Mountain Project's classic climbs for Northern Colorado!"
    puts "Enter 'list' to see types again or 'exit' to quit at any time."
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
        ClimbCatalog::Climb.list_boulder
        select_climb
      elsif input == "sport"
        ClimbCatalog::Climb.list_sport
        select_climb
      elsif input == "trad"
        ClimbCatalog::Climb.list_trad
        select_climb
      elsif input == "exit"
        goodbye
      else
        puts ""
        puts "Sorry, invalid input. Please try again."
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
      elsif input == ClimbCatalog::Climb.find(input.capitalize) # route names are capitalized
        puts "The climb's URL" # will actually send the user to the URL in their browser!!!
      elsif input == "exit"
        goodbye
      else
        puts ""
        puts "Sorry, invalid input. Please try again."
        select_climb
      end
    end
  end
  
  def goodbye
    puts ""
    puts "===== Climb on! ====="
    exit # why doesn't program exit from select_climb if this is removed?
  end

end

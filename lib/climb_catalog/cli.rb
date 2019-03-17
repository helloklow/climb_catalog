class ClimbCatalog::CLI

  def call
    puts ""
    puts "...loading climbs..."
    ClimbCatalog::Scraper.scrape_climbs
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
        print_climbs_by_type(input)
        select_climb
      elsif input == "sport"
        print_climbs_by_type(input)
        select_climb
      elsif input == "trad"
        print_climbs_by_type(input)
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
  
  def print_climbs_by_type(input)
    ClimbCatalog::Climb.all.select do |route| 
      if route.type == input.capitalize # route types are capitalized
        puts "- '#{route.name}' (#{route.type}) #{route.rating}"
      end
    end
  end
  
  def select_climb
    puts ""
    puts "Enter the name of the route you would like beta for:"
    
    input = nil
    climb = nil
    while input != "exit"
    input = gets.strip.split(' ').map(&:capitalize).join(' ')
      if input == "List"
        select_type
        binding.pry
      elsif climb == ClimbCatalog::Climb.find_by_name(input)
        puts ""
        puts "Connecting to #{climb.name} on Mountain Project:"
        puts "#{climb.url}" #'open #{url}'
        choose_more
      elsif input == "exit"
        goodbye
      else
        puts ""
        puts "Sorry, invalid input. Please try again."
        select_climb
      end
    end
  end

=begin  
  def print_climb_by_name(input)
    ClimbCatalog::Climb.all.select do |route| 
      if route.name == input.split(' ').map(&:capitalize).join(' ') # route names are capitalized
        puts ""
        puts "Connecting to #{route.name} on Mountain Project:"
        puts "#{route.url}" #'open #{url}'
        puts ""
        choose_more
      end
    end
  end
=end
  
  def choose_more
    puts ""
    puts "Enter 'list' to select a new climb or 'exit' to quit:"
    
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      if input == "list"
        select_type
      elsif input == "exit"
        goodbye
      else
        puts ""
        puts "Sorry, invalid input. Please try again."
        select_type
      end
    end
  end
  
  def goodbye
    puts ""
    puts "===== Climb on! ====="
    exit # why won't program exit properly from select_climb if this is removed?
  end

end

class ClimbCatalog::CLI

  def call
    puts ""
    puts "===== Welcome, Colorado Climber! ====="
    menu
    list_climbs
  end

  def menu
    puts ""
    puts "We've located the following types of climbing in your area:"
    ClimbCatalog::Climb.all.each.with_index(1) do |c, i|
      puts "#{i}. #{c.type}"
    end
    puts ""
    puts "Please enter the number you would like to see climbing routes for:"
    puts "Enter 'list' to see types again or 'exit' to quit."
    
    input = nil 
    while input != "exit"
    input = gets.strip.to_i
      if input == "list"
        menu
      elsif input <= ClimbCatalog::Climb.all.size 
        the_climb = ClimbCatalog::Climb.find(input)
        puts "the_climb.name"
      else
        puts "Sorry, I don't understand."
      end
    end
  end
  
  def list_climbs
    ClimbCatalog::Scraper.get_climbs
    ClimbCatalog::Scraper.create_climbs
    ClimbCatalog::Climb.all.each.with_index do |c, i|
      puts ""
      puts "#{c.name} at #{c.location} is #{c.type}"
    end
    puts ""
    puts "Which route would you like beta for?"
    answer = gets.strip.to_i
    if answer > 0
      print_destination(answer)
    else
      puts "Sorry, I don't understand."
      menu
    end
  end
  
  def goodbye
    puts ""
    puts "===== Climb on! ====="
  end

end

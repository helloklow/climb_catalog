class ClimbCatalog::CLI
  
  def call
    list_categories
    menu
    goodbye
  end
  
  def list_categories
    puts "Welcome, climber!"
    # pull category from mountain project for user to decide; input by typing category or 1, 2, or 3?
    puts "Boulder"
    puts "Sport"
    puts "Trad"
  end
  
  def menu
    puts "What type of climb would like today? Type exit to leave."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "boulder"
        puts "Lists boulders..."
      when "sport"
       puts "Lists sport climbs..."
      when "trad"
        puts "Lists trad climbs..."
      end
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
end
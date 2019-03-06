class ClimbCatalog::CLI
  
  def call
    puts "Welcome, climber!" # removed from #list_categories so it doesn't run when user calls list
    list_categories
    menu
    goodbye
  end
  
  def list_categories
    # pull category from mountain project for user to decide; input by typing category or 1, 2, or 3?
    puts "Boulder"
    puts "Sport"
    puts "Trad"
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "What type of climb would like today? Enter list to view categories again or exit to leave."
      input = gets.strip.downcase
      case input
      when "boulder"
        puts "Lists boulders..."
      when "sport"
       puts "Lists sport climbs..."
      when "trad"
        puts "Lists trad climbs..."
      when "list"
        list_categories
      end
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
end
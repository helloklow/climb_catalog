class ClimbCatalog::CLI
  
  def call
    puts "Welcome, climber!" # removed from #list_categories so it doesn't run when user calls list
    list_categories
    menu
    goodbye
  end
  
  def list_categories
    # pull category from mountain project for user to decide; input by typing category or 1, 2, or 3?
    puts "1 - Easy"
    puts "2 - Intermediate"
    puts "3 - Advanced"
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "What type of climb would like today? Enter list to view categories or exit to leave."
      input = gets.strip.downcase
      
      
      #case input
      #when "boulder"
        #puts "Lists boulders..."
      #when "sport"
       #puts "Lists sport climbs..."
      #when "trad"
        #puts "Lists trad climbs..."
      #when "list"
        
      if input.to_i > 0 
        puts @climbs[input.to_i-1]
      elsif input == "list"
        list_categories
      else
        puts "You're must be too strong for these parts! Please enter a valid climbing difficulty." unless input == "exit"
      end
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
end
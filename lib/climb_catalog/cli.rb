class ClimbCatalog::CLI

  def call
    puts "Welcome to the Top International Climbing Destinations!"
    list_destinations
    menu
    goodbye
  end
  
  def list_destinations
      puts ""
      puts "We've found 15 of the most iconic worldwide climbing destinations:"
      puts "1. Chaltén Massif, Argentina - Trad Climbing"
      puts "2. Mount Arapiles, Australia - Trad Climbing"
      puts "3. Bugaboos, Canada - Trad Climbing"
      puts ""
  end
   
  def menu
    input = nil 
    while input != "exit"
      puts "Please enter the number of the destination that you would like to learn about:"
      input = gets.strip
      puts ""
      case input
      when "1"
        puts "Chaltén Massif, Argentina description"
      when "2"
        puts "Mount Arapiles, Australia description"
      when "3"
        puts "Bugaboos, Canada description"
      end
      puts ""
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
end
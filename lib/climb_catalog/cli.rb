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
      @destinations = ClimbCatalog::Destination.all_destinations
  end
   
  def menu
    input = nil 
    while input != "exit"
      puts "Enter the number of the destination that you would like to learn about:"
      puts "Enter 'all' to see all destinations again, or 'exit' to leave."
      input = gets.strip
      case input
      when "1"
        puts "Chaltén Massif, Argentina description"
        puts ""
      when "2"
        puts "Mount Arapiles, Australia description"
        puts ""
      when "3"
        puts "Bugaboos, Canada description"
        puts ""
      when "all"
        list_destinations
      end
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
end
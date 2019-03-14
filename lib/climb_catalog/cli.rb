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
      @destinations.each do |destination|
        puts "#{destination.name} - #{destination.type}"
      end
  end
   
  def menu
    input = nil 
    while input != "exit"
      puts "Enter the number of the destination that you would like to learn about:"
      puts "Enter 'all' to see all destinations again, or 'exit' to leave."
      input = gets.strip
      
      if input.to_i > 0 # if input is an integer and not a string 
        puts @destinations[input.to_i-1] # puts the destination at the correct index
      elsif input == "all"
        list_destinations
      else
        puts "I'm sorry, I don't understand."
      end
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
end
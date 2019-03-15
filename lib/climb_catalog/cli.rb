class ClimbCatalog::CLI

  def call
    start
    puts ""
    menu
  end

  def start
    puts ""
    puts "Welcome to the Top International Climbing Destinations!"
    puts ""
    puts "We've located 15 of the most iconic worldwide climbing destinations!"
    puts "+ Enter 'list' to view all destinations."
    #puts "+ Enter the destination number to learn more."
    puts "+ Enter 'exit' to leave."
    puts ""
  end
  
  def menu
    input = nil 
    puts "What would you like to do?"
    input = gets.strip.downcase
      case input
      when "list"
        puts list_destinations
        puts "Enter the number of the destination that you would like to learn more about:"
        answer = gets.strip.to_i
        print_destination(answer)
      when "exit"
        goodbye
      end
  end
  
  def list_destinations
    ClimbCatalog::Scraper.get_destinations
    ClimbCatalog::Scraper.create_destinations
    ClimbCatalog::Destination.all.each.with_index do |d, i|
      puts "#{d.name}"
    end
  end
  
  def print_destination(answer)
    ClimbCatalog::Destination.all.each.with_index do |d, i|
      if i == answer
        puts "#{d.name} - #{d.type}"
        puts "#{d.description}"
      end
    end
  end
  
  def goodbye
    puts "Climb on!"
    exit
  end

end














=begin 
 def menu
    puts "We've found 15 of the most iconic worldwide climbing destinations:"
    list_destinations
    
    puts "Enter the number of the destination you would like to learn more about:"
    input = gets.strip.to_i

    d = ClimbCatalog::Destination.find(input)

    print_destination(d)
    
    puts "Would you like to select another destination? (Y / N)"
    input = gets.strip.downcase
    
    if input == "y"
      menu
    elsif input == "n"
      goodbye
    else
      puts ""
      puts "I'm sorry, I don't understand."
      puts ""
      menu
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
  def list_destinations
    ClimbCatalog::Destination.all.each do |d|
      puts "#{d.name} - #{d.type}"
      puts ""
    end
  end

  def print_destination(d)
    puts ""
    puts "#{destination.name} - #{destination.type}"
    puts "#{destination.description}"
    puts ""
  end
=end
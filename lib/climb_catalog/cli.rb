class ClimbCatalog::CLI
  
  def call
   #ClimbCatalog::Climb.new.create_climbs
    puts "Welcome, climber!" 
    climb_type
  end
  
  def climb_type
    puts "What type of climb are you interested in? Please enter boulder, sport, or trad."
    input = gets.strip.downcase
    
    print_climbs(input) # program lists climbs of type
  
    choose_climb
  end
  
  def choose_climb
    puts "Which climb would you like beta for?"
    input = gets.strip.downcase
    # program finds correct climb by name or index??
    #climb = ClimbCatalog::Climb.find(input.to_i) # should this be to_i in my case?
    if input != nil
      puts "ALL the info on your climb!"
    else
      puts "Sorry, which climb?"
    end
    #print_climb(climb) # program returns details for climb
 
    choose_more
  end
   
   def choose_more 
    puts "Would you like to choose another climb? yes / no"
     input = gets.strip.downcase
    if input == "yes"
      climb_type
    elsif input == "no"
      goodbye
    else
      puts "Sorry, I don't understand. Please enter yes or no."
      choose_more
    end
  end
  
  def goodbye
    puts "Climb on!"
  end
  
  
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
  end
  
  def get_climbs
    #climb = {}
    #climb[:name] = doc.search("tr.route-row").attribute("href").text
    #climb[:type] = doc.search("span.small .text-warm .pl-half").text
    #climb[:grade] = doc.search("span.rateYDS").text
    #climb[:location] = doc.search("span.text-warm").attribute("href").text
    #climb
    
    self.get_page.css("tr.route-row a")
  end
  
  def make_climbs
    self.get_climbs.each do |route|
      route = Climb.new
      route.name = route.css("tr.route-row a").text
      route.type = route.css("span.small .text-warm .pl-half").text
      route.grade = route.css("span.rateYDS").text
      route.location = route.css("span.text-warm a").text
    end
  end
  
  def print_climbs(input)
    self.make_climbs
    Climb.all.select do |route|
      if route.type == input
        puts "#{route.type.capitalize} climbs in Fort Collins:"
        puts ""
        puts "#{index}. #{route.name} - #{route.grade}, #{route.location}"
      end
    end
  end
  
  #def print_climbs(type) # how do I pass in the type??
    #puts "#{type.capitalize} climbs in Fort Collins:"
    #puts ""
    #ClimbCatalog::Climb.all.each do |climb, index|
      #puts "#{index}. #{climb.name}, #{climb.location}"
    #end
  #end
  
  #def print_climb(climb)
    
  #end
  
end
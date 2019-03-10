class ClimbCatalog::Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
  end
  
  def get_destinations # grabs and returns all elements that contain a destination attr via selector
    self.get_page.css("h3")
  end
  
  def make_destinations
    # operates on the collection of destinations #get_destinations
    # iterates through and instantiates objects using HTML selectors to scrape specific attrs
    get_destinations.each do |location|
      ClimbCatalog::Destination.new_from_web(location)
    end
  end
  
  def print_destinations
    self.make_destinations
    Destination.all.each do |location|
      if location.name
        puts "#{location.name}:"
        puts "#{location.description}"
      end
    end
  end
  
end
  
    #get_destinations.each do |location|
      #ClimbCatalog::Destination.new_from_web(location)
    #end
  
 # def self.scrape_climbs

  #  doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
    
   # climbs = {}
    
  #  doc.css("tr.route-row .bg-gray-background").each do |route|
     # name = route.css("tr.route-row .bg-gray-background a").text.strip
   #   climbs[name.to_sym] = {
     #   :type => route.css("span.small .text-warm .pl-half").text.strip,
     #   :grade => route.css("span.rateYDS").text.strip,
     #   :location => route.css("span.text-warm a").text.strip
    #  }
   # end
  #  climbs
 # end
 
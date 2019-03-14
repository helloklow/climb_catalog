class ClimbCatalog::Scraper
  
  attr_accessor :name, :type, :description
  
  def self.list_destinations(type)
    self.scrape_destinations(type)
  end
  
  def self.scrape_destinations(type)
    array = []
    
    doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
    doc.search("div.entry-content .blog-container h3").each do |destination|
      
      destination = ClimbCatalog::Destination.new
      destination.name = doc.search("h3").text.strip, # h3 provides name attr
      destination.type = doc.search("h2").text.strip, # h2 provides type attr
      destination.description = doc.search("p").text.strip # p provides description attr
  end
 
  
end

 #def self.scrape_destinations(type)
   # doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
   # doc.search("div.entry-content .blog-container").each do |destination|
     # destination = ClimbCatalog::Destination.new
      #destination.name = doc.search("h3").text.strip, # h3 provides name attr
     # destination.type = doc.search("h2").text.strip, # h2 provides type attr
      #destination.description = doc.search("p").text.strip # p provides description attr
    #end
 # end



#def get_page
   # doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
  #end
  
  #def get_destinations # grabs and returns all elements that contain a location attr via selector
   # self.get_page.css("h3")
 # end
  
 # def make_destinations
    # operates on the collection of destinations #get_destinations
    # iterates through and instantiates objects using HTML selectors to scrape specific attrs
   # get_destinations.each do |location|
     # ClimbCatalog::Destination.new_from_web(location)
   # end
 # end
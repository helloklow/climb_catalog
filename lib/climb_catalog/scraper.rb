class ClimbCatalog::Scraper
  
  def self.scrape_destinations(type)
    doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
    doc.search("div.entry-content .blog-container").each do |destination|
      destination = ClimbCatalog::Destination.new
      destination.name("h3").text.strip, # h3 provides name attr
      destination.type("h2").text.strip, # h2 provides type attr
      destination.description("p").text.strip # p provides description attr
    end
  end
  
end


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
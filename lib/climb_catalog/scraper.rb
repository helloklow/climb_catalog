class ClimbCatalog::Scraper
  attr_accessor :name, :type
  
  def self.list_destinations
    self.scrape_destinations
  end
 
 def self.scrape_destinations
   destinations_array = []
   
   doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
   destinations = doc.search("div.entry-content.blog-container h3")
   destinations.each_with_index do |destination, i|
     if index < 15 then
       new_destination = ClimbCatalog::Scraper.new
       new_destination.name = destination.css("h3").text
       new_destination.type = destination.css("h2").text
       new_destination.description = destination.css("p").text
       destinations_array[index] = new_destination
   end
   destinations_array
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
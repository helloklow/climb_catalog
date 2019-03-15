class ClimbCatalog::Scraper

 def self.get_destinations
    @doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
    @destinations = @doc.css("div.entry-content h3")
  end

  def self.create_destinations
        @destinations.each do |d|
        name = d.css("h3").text.strip
        type = d.css("h2").text.strip
        description = d.css("p").text.strip
        destination = ClimbCatalog::Destination.new(name, type, description)
        ClimbCatalog::Destination.all << destination
    end
  end
  
end














=begin
  def get_page
    doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
  end

  def get_destinations
     self.get_page.css("div.entry-content h3")
  end

  def create_destinations
    get_destinations.each do |d|
      ClimbCatalog::Destination.new_destination(d)
    end
  end
=end














#class ClimbCatalog::Scraper
  
  #def get_page
   # doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
  #end
  
  #def scrape_destinations # grabs and returns all elements that contain a location attr via selector
   # self.get_page.css("div.entry-content h3")
 # end
  
 # def create_destinations
     # operates on the collection of scraped destinations
     # iterates through and instantiates objects using HTML selectors to scrape specific attrs (defined in destination class)
   # scrape_destinations.each do |location|
      #ClimbCatalog::Destination.new_from_web(location)
    #end
 # end
  
#end


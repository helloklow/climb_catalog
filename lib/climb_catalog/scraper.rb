class ClimbCatalog::Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.osprey.com/stories/15-iconic-climbing-destinations-outside-us/"))
  end
  
  def scrape_destinations # grabs and returns all elements that contain a location attr via selector
    self.get_page.css("div.entry-content h3")
  end
  
  def create_destinations
     # operates on the collection of scraped destinations
     # iterates through and instantiates objects using HTML selectors to scrape specific attrs (defined in destination class)
    scrape_destinations.each do |location|
      ClimbCatalog::Destination.new_from_web(location)
    end
  end
  
end


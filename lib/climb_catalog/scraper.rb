class ClimbCatalog::Scraper
  
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
    
    self.get_page.css("tr.route-row").attribute("href").text
  end
  
  def make_climbs
    self.get_climbs.each do |route|
      route = Climb.new
      route.name = route.css("tr.route-row").attribute("href").text
      route.type = route.css("span.small .text-warm .pl-half").text
      route.grade = route.css("span.rateYDS").text
      route.location = route.css("span.text-warm").attribute("href").text
  end
  
  def print_climbs
    
  end
 #def scrape_classic_climbs
  # self.get_page.css("td").attribute("href").text
# end

# def create_climbs
  # scrape_classic_climbs.each do |route|
    # ClimbCatalog::Climb.new_from_classic_climbs(url)
  # end
# end
  
end
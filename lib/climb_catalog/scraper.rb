class ClimbCatalog::Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
  end
  

  

  
  #Scraper.new.print_climbs
  
 #def scrape_classic_climbs
  # self.get_page.css("td").attribute("href").text
# end

# def create_climbs
  # scrape_classic_climbs.each do |route|
    # ClimbCatalog::Climb.new_from_classic_climbs(url)
  # end
# end
  
end
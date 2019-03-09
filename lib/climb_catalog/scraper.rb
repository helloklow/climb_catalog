class ClimbCatalog::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
  end
  
  def scrape_classic_climbs
    self.get_page.css("td").attribute("href").text
  end

  def create_climbs
    scrape_classic_climbs.each do |route|
      ClimbCatalog::Climb.new_from_classic_climbs(route)
    end
  end
  
end
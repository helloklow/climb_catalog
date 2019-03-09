class ClimbCatalog::Scraper
  
  def initialize(url)
      # fill in climb's data
    doc = Nokogiri::HTML(open(url))
    climb = {}
    
    climb[:name] = doc.search("tr.route-row").attribute("href").text
    climb.[:type] = doc.search("span.small .text-warm .pl-half").text
    climb.[:grade] = doc.search("span.rateYDS").text
    climb.[:location] = doc.search("span.text-warm").attribute("href").text
  end
    
  def get_page
    Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
  end
  
  def scrape_classic_climbs
    self.get_page.css("td").attribute("href").text
  end

  def create_climbs
    scrape_classic_climbs.each do |route|
      ClimbCatalog::Climb.new_from_classic_climbs(url)
    end
  end
  
end
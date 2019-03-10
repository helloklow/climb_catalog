class ClimbCatalog::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
  end
  
  def get_climbs
    self.get_page.css("tr.route-row .bg-gray-background")
  end
  
  def make_climbs
      get_climbs.each do |route|
        ClimbCatalog::Climb.new_from_classic_climbs(route)
      end
    end
    
  end
  
  
  
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
 
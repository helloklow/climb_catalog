class ClimbCatalog::Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
  end
  
  def get_climbs
    self.get_page.css("tr.route-row a")
  end
  
  def make_climbs
    self.get_climbs.each do |route|
      route = Climb.new
      route.name = route.css("tr.route-row a").text
      route.type = route.css("span.small .text-warm .pl-half").text
      route.grade = route.css("span.rateYDS").text
      route.location = route.css("span.text-warm a").text
    end
  end
  
end
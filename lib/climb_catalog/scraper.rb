class ClimbCatalog::Scraper

  def self.scrape_climbs
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
    row = doc.css("div.table-responsive table.table.route-table.hidden-xs-down tr.route-row")
    
    row.each do |c|
      name = c.css("td a strong").text.strip
      location = c.css("td span.small span.text-warm a").text.strip
      rating = c.css("td span.rateYDS").text.strip
      type = c.css("td span.small.text-warm.pl-half span").text.strip
      url = c.css("td href").text.strip
      climb = ClimbCatalog::Climb.new(name, location, rating, type, url)
      climb.save
    end
  end
  
end
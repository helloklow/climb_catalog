class ClimbCatalog::Scraper

 def self.get_climbs
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
    climbs = doc.css("tr.route-row") # scrapes each table row
    binding.pry
  end

  def self.create_climbs
    climbs.each do |c|
      name = c.css("span.text-warm a").text.strip
      location = c.css("span.rateYDS").text.strip
      rating = c.css("span.rateYDS").text.strip
      type = c.css("span.small.text-warm.pl-half span").text.strip
      url = c.css("span.text-warm href").text.strip
      destination = ClimbCatalog::Destination.new(name, type, description)
      destination.save
    end
  end
  
end

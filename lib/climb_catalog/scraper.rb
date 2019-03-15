class ClimbCatalog::Scraper

 def self.get_climbs
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
    climbs = doc.css("tr.route-row") # scrapes each table row
    binding.pry
  end

  def self.create_climbs
    climbs.each do |c|
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

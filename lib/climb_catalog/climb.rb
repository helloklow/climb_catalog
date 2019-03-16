class ClimbCatalog::Climb

  attr_accessor :name, :location, :rating, :type, :url

  @@all = []
  
  def initialize(name, location, rating, type, url)
    @name = name
    @location = location
    @rating = rating
    @type = type
    @url = url
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.find(i)
    self.all.find {|i| i == ClimbCatalog::Climb.name}
  end

  def self.scrape_climbs
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))
    row = doc.css("div.table-responsive table.table.route-table.hidden-xs-down")

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip
      
    climb = self.new(name, location, rating, type, url)
    climb.save
  end
  
end

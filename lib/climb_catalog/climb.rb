class ClimbCatalog::Climb

  attr_accessor :name, :location, :rating, :type, :url

  @@all = []
  
  def initialize(name, location, rating, type, url)
    @name = name
    @location = location
    @rating = rating
    @type = type
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self.get_climbs
  end
  
  def self.find(i)
    self.all.find {|i| i == ClimbCatalog::Climb.name}
  end

  def self.get_climbs
    climbs = []

     climbs << self.list_boulder
     climbs << self.list_sport
     climbs << self.list_trad
  end

  def self.list_boulder
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip
      
    boulder = self.new(name, location, rating, type, url)
  end

  def self.list_sport
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip

    sport = self.new(name, location, rating, type, url)
  end

  def self.list_trad
    doc = Nokogiri::HTML(open("https://www.mountainproject.com/area/classics/105800315/fort-collins"))

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip

    trad = self.new(name, location, rating, type, url)
  end
  
end

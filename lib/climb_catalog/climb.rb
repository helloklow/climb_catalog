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
  
  def self.find(input)
    self.all[input]
  end

  def self.get_climbs
    climbs = []

     climbs << self.get_boulder
     climbs << self.get_sport
     climbs << self.get_trad
  end

  def self.get_boulder
    html = open("https://www.mountainproject.com/area/classics/105800315/fort-collins")
    doc = Nokogiri::HTML(html)

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip
      
    boulder = self.new(name, location, rating, type, url)
  end

  def self.get_sport
    html = open("https://www.mountainproject.com/area/classics/105800315/fort-collins")
    doc = Nokogiri::HTML(html)

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip

    sport = self.new(name, location, rating, type, url)
  end

  def self.get_trad
    html = open("https://www.mountainproject.com/area/classics/105800315/fort-collins")
    doc = Nokogiri::HTML(html)

    name = doc.css("td a strong").text.strip
    location = doc.css("td span.small span.text-warm a").text.strip
    rating = doc.css("td span.rateYDS").text.strip
    type = doc.css("td span.small.text-warm.pl-half span").text.strip
    url = doc.css("td href").text.strip

    trad = self.new(name, location, rating, type, url)
  end
  
  def self.find(i)
    self.all[i.to_i - 1]
  end
  
  def list_type
    self.all.find #finish this method!
  end
  
end

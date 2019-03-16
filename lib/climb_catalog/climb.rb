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
    @@all << self.scrape_climbs
  end
  
  def self.find_climb(i)
    self.all[i.to_i - 1]
  end

  def self.scrape_climbs
    climbs = []

     climbs << self.scrape_breakfast
     climbs << self.scrape_lunch
     climbs << self.scrape_dinner
  end

  def self.scrape_breakfast
    html = open("https://www.tasteaholics.com/recipes/low-carb-breakfast/")
    doc = Nokogiri::HTML(html)

    title = doc.css("div.entry-title").text.gsub(/\t/, "")
    category = doc.css("h1.title-heading-center").text
    breakfast = self.new(title, category)
  end

  def self.scrape_lunch
    html = open("https://www.tasteaholics.com/recipes/low-carb-lunch/")
    doc = Nokogiri::HTML(html)

    title = doc.css("div.entry-title").text.gsub(/\t/, "")
    category = doc.css("h1.title-heading-center").text

    lunch = self.new(title, category)
  end

  def self.scrape_dinner
    html = open("https://www.tasteaholics.com/recipes/low-carb-dinners/")
    doc = Nokogiri::HTML(html)

    title = doc.css("div.entry-title").text.gsub(/\t/, "")
    category = doc.css("h1.title-heading-center").text

    dinner = self.new(title, category)
  end
  
  def self.find(i)
    self.all[i.to_i - 1]
  end
  
  def list_type
    self.all.find #finish this method!
  end
  
end

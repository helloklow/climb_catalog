class ClimbCatalog::Climb 
  
  attr_accessor :name, :type, :grade, :location, :description, :url
  
  @@all = []
  
  def self.new_from_classic_climbs(url)
    #self.new(
      #route.css("td").attribute("href").text, # name
      #route.css(".small .text-warm .pl-half").text, # type
      #route.css(".rateYDS").text, # grade
      #route.css(".text-warm").text # location
      #)
      
    climb = Climb.new
    # fill in climb's data
    doc = Nokogiri::HTML(open(url))
    name = doc.search("tr.route-row").attribute("href").text
    type = doc.search("span.small .text-warm .pl-half").text
    grade = doc.search("span.rateYDS").text
    location = doc.search("span.text-warm").attribute("href").text
    
    climb
  end
  
  def initialize(name=nil, type=nil, grade=nil, location=nil)
    @name = name 
    @type = type
    @grade = grade
    @location = location
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(type)
    self.all[type]
  end
    
  def grade
    
  end
    
  def location
    
  end
  
  def description
    
  end
  
  def url
    
  end
  
  def doc
    #@doc ||= Nokogiri::HTML(open(self.url))
  end
  
end
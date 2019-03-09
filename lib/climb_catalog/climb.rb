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
    name = doc.search()
    type = doc.search()
    grade = doc.search()
    location = doc.search()
    
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
class ClimbCatalog::Climb 
  
  attr_accessor :name, :type, :grade, :state, :location, :description, :url
  
  @@all = []
  
  def self.scrape_classics_page(route)
    self.new(
      # name - route.css("td").attribute("href").text
      # type - route.css(".small .text-warm .pl-half").text
      # grade - route.css(".rateYDS").text
      # state - route.css(".left-nav-row .l-2").attribute("href").text
      # location - route.css(".text-warm").text
      )
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
  
end
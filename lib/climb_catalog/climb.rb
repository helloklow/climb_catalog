class ClimbCatalog::Climb 
  
  attr_accessor :name, :type, :grade, :state, :location, :description, :url
  
  @@all = []
  
  def self.new_from_classic_climbs(route)
    self.new(
      route.css("td").attribute("href").text, # name
      route.css(".small .text-warm .pl-half").text, # type
      route.css(".rateYDS").text, # grade
      route.css(".left-nav-row .l-2").attribute("href").text, # state
      route.css(".text-warm").text # location
      )
  end
  
  def initialize(name=nil, type=nil, grade=nil, state=nil, location=nil)
    @name = name 
    @type = type
    @grade = grade
    @state = state
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
  
  #def doc
    #@doc ||= Nokogiri::HTML(open(self.url))
  #end
  
end
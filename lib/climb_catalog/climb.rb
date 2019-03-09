class ClimbCatalog::Climb 
  
  attr_accessor :name, :type, :grade, :location, :description, :url
  
  @@all = []
  
  def self.new_from_classic_climbs(url)
    climb = Climb.new
    
    properties = Scraper.mountain_project(url)
    properties.each do |x, y|
      climb.send("#{x}=", y)
    end
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
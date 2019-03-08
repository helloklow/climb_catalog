class ClimbCatalog::Climb 
  
  attr_accessor :name, :type, :grade, :location, :description, :url
  
  @@all = []
  
  def self.new_from_classics_page(x)
    self.new()
  end
  
  def initialize(name=nil, type=nil, grade=nil, location=nil, url=nil)
    @name = name
    @type = type
    @grade = grade
    @location = location
    @url = url
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
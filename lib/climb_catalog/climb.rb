class ClimbCatalog::Climb 
  
  attr_accessor :name, :type, :grade, :location, :description, :url
  
  @@all = []
  
  def self.new_from_classic_climbs(url)
    Climb.new.tap do |climb|
      Scraper.get_page.each do |x, y|
        climb.send("#{x}=", y)
      end
    end
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
  
 #def self.find(type)
   #self.all[type]
 #end
    
end
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
    save
  end
  
  def self.all
    @@all
  end

  def save
    self.all << self
  end

  def self.find_by_index(index)
    self.all[index]
  end
  
 def self.find_by_type(type)
   self.all[type]
 end
    
end
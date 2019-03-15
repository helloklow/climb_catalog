class ClimbCatalog::Climb

  attr_accessor :name, :location, :rating, :type

  @@all = []
  
  def initialize(name, location, rating, type)
    @name = name
    @location = location
    @rating = rating
    @type = type
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
end

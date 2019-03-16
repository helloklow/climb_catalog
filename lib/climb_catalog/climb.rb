class ClimbCatalog::Climb

  attr_accessor :name, :location, :rating, :type, :url

  @@all = []
  
  def initialize(name, location, rating, type, url)
    @name = name
    @location = location
    @rating = rating
    @type = type
    @url = url
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.find(i)
    self.all[i.to_i - 1]
  end
  
end

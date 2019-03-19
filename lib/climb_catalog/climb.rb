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
  
  def self.find_by_name(input)
    self.all.find { |climb| climb.name == input.capitalize } # route names are capitalized
  end
  
end

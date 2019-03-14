class ClimbCatalog::Destination 
  
  attr_accessor :name, :type, :description
  
  @@all = []
  
  def self.new_from_web(location)
    self.new(
      location.css("h3").text.strip, # h3 provides name attr
      location.css("h2").text.strip, # h2 provides type attr
      location.css("p").text.strip # p provides description attr
      )
  end
  
  def initialize(name, type, description)
    @name = name
    @type = type
    @description = description
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(id)
    self.all[id-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
    
end
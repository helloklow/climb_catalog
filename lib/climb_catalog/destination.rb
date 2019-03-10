class ClimbCatalog::Destination 
  
  attr_accessor :name, :type, :description
  
  @@all = []
  
  def self.new_from_web(location)
    #Climb.new.tap do |climb|
      #Scraper.get_page.each do |x, y|
        #climb.send("#{x}=", y)
      #end
    #end
    self.new(
      location.css("h3").text.strip, #name
      location.css("h2").text.strip, #type
      location.css("p").text.strip #description
      )
  end
  
  def initialize(name=nil, type=nil, description=nil)
    @name = name
    @type = type
    @description = description
    save
  end
  
  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_index(index)
    self.all[index]
  end
  
  def self.find_by_name(location)
   self.all[location]
  end
  
  def self.find_by_type(type)
   self.all[type]
  end
    
end
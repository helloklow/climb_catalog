class ClimbCatalog::Climb 
  
  attr_accessor :destination, :type, :description
  
  @@all = []
  
  def self.new_from_classic_climbs(route)
    #Climb.new.tap do |climb|
      #Scraper.get_page.each do |x, y|
        #climb.send("#{x}=", y)
      #end
    #end
    self.new(
      route.css("tr.route-row .bg-gray-background").text.strip, #destination
      route.css("span.small .text-warm .pl-half").text.strip, #type
      route.css("span.rateYDS").text.strip, #description
      )
  end
  
  def initialize(destination=nil, type=nil, description=nil)
    @destination = destination 
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

  def self.find_by_index(index)
    self.all[index]
  end
  
 def self.find_by_type(type)
   self.all[type]
 end
    
end
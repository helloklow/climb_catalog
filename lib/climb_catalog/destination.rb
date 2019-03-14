class ClimbCatalog::Destination 
  
  attr_accessor :name, :type, :description
  
 # @@all = []
  
  def self.new_destination
    # should return instances of Destination 
      dest1 = self.new
      dest1.name = "1. Chaltén Massif, Argentina"
      dest1.type= "Trad Climbing"
      dest1.description = "The sharp peaks of the Chaltén Massif on the eastern edge of the windswept Patagonian Icecap in southern Argentina offer some of the best alpine trad climbs in the world, with jam cracks splitting clean walls and summits wreathed in ice. While world-class alpinists speed up the big peaks like Fitz Roy and Cerro Torre, other climbers scale smaller spires and visit outlying areas like Frey."
      
      dest2 = self.new
      dest2.name = "2. Mount Arapiles, Australia "
      dest2.type= "Trad Climbing"
      dest2.description = "Mount Arapiles, one of the world’s finest cliffs, rises from a flat plain in the province of Victoria. Under the watchful eye of kangaroos, you’ll find more than 2,000 routes. Arapiles’ wide spectrum of grades ensures vertical fun for everyone. The compact area is a sandstone dome studded with handholds and plenty of cracks for cams. The famous Pines campground, a stone’s throw from Arap’s base, is Australia’s version of Yosemite’s colorful Camp 4."
      
      dest3 = self.new
      dest3.name = "3. Bugaboos, Canada"
      dest3.type= "Trad Climbing"
      dest3.description = "The Bugaboos, a range of soaring granite peaks in British Columbia, is North America’s answer to the French Alps. The iconic peaks, including Pigeon Spire, Bugaboo Spire, and Snowpatch Spire, form an alpine playground with flawless stone, classic routes, and amazing scenery. The Bugs rise above a glacier and offer easy scrambles up ridges, stacks of moderate climbs, and extreme multi-pitch routes."
  end
  
 # def initialize(name, type, description)
   # @name = name
   # @type = type
   # @description = description
   # save
 # end
  
#  def save
   # @@all << self
 # end
  
 # def self.all
  #  @@all
 # end
  
 # def self.find(id)
 #   self.all[id-1]
 # end

end
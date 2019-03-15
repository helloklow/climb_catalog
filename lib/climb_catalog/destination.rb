class ClimbCatalog::Restaurant

  attr_accessor :name, :position, :location, :url, :head_chef, :website_url, :food_style, :best_dish, :contact, :description

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h2").text,
      "https://www.theworlds50best.com#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end

  def initialize(name=nil, url=nil, location=nil, position=nil)
    @name = name
    @url = url
    @location = location
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def best_dish
    @best_dish ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
    # @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end

  def food_style
    @food_style ||= doc.css("div.c-4.nr.nt ul:nth-child(6) li").text
    # @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  end

  def contact
    @contact ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(1)").text.split("+").join(". Tel: +")
    # @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def head_chef
    @head_chef ||= doc.css("div.c-4.nr.nt ul:nth-child(3) li").text.split(" (pictured)").join("")
    # @head_chef ||= doc.xpath("//div[@class='c-4 nr nt']/ul[1]/li").text.split(" (pictured)").join("")
  end

  def website_url
    @website_url ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(2) a").text
    # @website_url ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[2]/a").text
  end

  def description
    @description ||= doc.css("div.c-8.nl.nt > p:nth-child(6)").text
    # @description ||= doc.xpath("//div[@class='c-8 nl nt']/p[3]").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end


























=begin

class ClimbCatalog::Destination 
  
  attr_accessor :name, :type, :description
  
 # @@all = []
  
  def self.all_destinations
    # should return instances of Destination 
    
    puts "1. Chaltén Massif, Argentina - Trad Climbing"
    puts "2. Mount Arapiles, Australia - Trad Climbing"
    puts "3. Bugaboos, Canada - Trad Climbing"
    puts ""
    
      dest1 = self.new
      dest1.name = "1. Chaltén Massif, Argentina"
      dest1.type= "Trad Climbing"
      dest1.description = "The sharp peaks of the Chaltén Massif on the eastern edge of the windswept Patagonian Icecap in southern Argentina offer some of the best alpine trad climbs in the world, with jam cracks splitting clean walls and summits wreathed in ice. While world-class alpinists speed up the big peaks like Fitz Roy and Cerro Torre, other climbers scale smaller spires and visit outlying areas like Frey."
      
      dest2 = self.new
      dest2.name = "2. Mount Arapiles, Australia"
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


=end
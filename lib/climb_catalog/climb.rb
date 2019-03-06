class ClimbCatalog::Climb 
  attr_accessor :name, :grade, :location, :url
  
  def self.boulder
    # @boulder = ClimbCatalog::Climb.boulder #=> return instances of bouldering routes
    boulder_1 = self.new
    boulder_1.name = "Climb name"
    boulder_1.grade = "Climb grade"
    boulder_1.location = "Climb location"
    boulder_1.url = "Climb url"
    
    boulder_2 = self.new
    boulder_2.name = "Climb name"
    boulder_2.grade = "Climb grade"
    boulder_2.location = "Climb location"
    boulder_2.url = "Climb url"
    
    [boulder_1, boulder_2]
  end
  
  def self.sport
    # @sport = ClimbCatalog::Climb.sport #=> return instances of sport climbing routes
  end
  
  def self.trad
    # @trad = ClimbCatalog::Climb.trad #=> return instances of trad climbing routes
  end
    
  def grade
    # @boulder_grade = ClimbCatalog::Climb.boulder.grade #=> lists bouldering routes by difficulty
    # @sport_grade = ClimbCatalog::Climb.sport.grade #=> lists sport climbing routes by difficulty
    # @trad_grade = ClimbCatalog::Climb.trad.grade #=> lists trad climbing routes by difficulty
  end
    
    # summary and url methods?
  
end
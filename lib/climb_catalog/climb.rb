class ClimbCatalog::Climb 
  attr_accessor :name, :grade, :location, :url
  
  def self.all
    # @boulder = ClimbCatalog::Climb.boulder #=> return instances of bouldering routes
    boulder_ez = self.new
    boulder_ez.name = "Climb name"
    boulder_ez.grade = "Climb grade"
    boulder_ez.location = "Climb location"
    boulder_ez.url = "Climb url"
    
    boulder_int = self.new
    boulder_int.name = "Climb name"
    boulder_int.grade = "Climb grade"
    boulder_int.location = "Climb location"
    boulder_int.url = "Climb url"
    
    boulder_adv = self.new
    boulder_adv.name = "Climb name"
    boulder_adv.grade = "Climb grade"
    boulder_adv.location = "Climb location"
    boulder_adv.url = "Climb url"
    
    [boulder_ez, boulder_int, boulder_adv]
  end
    
  def grade
    # ClimbCatalog::Climb.grade #=> returns grade of boulder
  end
    
  def location
    # ClimbCatalog::Climb.location #=> returns location of boulder
  end
  
  def url
    # ClimbCatalog::Climb.url #=> sends user to url for boulder
  end
  
end
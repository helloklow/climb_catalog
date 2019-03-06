class ClimbCatalog::CLI
  
  def call
    puts "Climbing?"
    list_categories
  end
  
  def list_categories
    puts "Bouldering, sport climbing, or traditional climbing?"
  end
end
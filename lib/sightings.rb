class Sighting 
  attr_accessor :index, :name, :date, :url
  
  @@all = []
  
  def initialize(index, name, date, url)
    @index = index
    @name = name
    @date = date 
    @url = url 
    @@all << self
  end

  def self.all 
     @@all 
  end 

  def self.find_by_index(index)
    return @@all.detect do |sighting| 
    sighting.index == index 
    end
  end

    
    

  def self.print_sightings_list
    @@all.each do |sighting|
    puts "#{sighting.index}. #{sighting.name}"
    end
  end
     

     




    

end

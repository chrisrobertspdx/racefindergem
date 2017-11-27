class RaceFinder::CLI
  attr_accessor :calendar
  BASE_URL = 'http://www.racecenter.org'

  def run
    puts "Hello. I would like to help you find a bike race."
    add_races_to_calendar
    list_races
    #get / add races
    #ask for selection
    #add_attributes_to_races
    #display_recs
  end
  
  def add_races_to_calendar
    self.calendar = RaceFinder::Calendar.new(type: "Bike Races")
    self.calendar.races << RaceFinder::Race.new(name: "Crusade 1")
    self.calendar.races << RaceFinder::Race.new(name: "Crusade 2")
  end
    
  
  
  def list_races
    self.calendar.races.each.with_index(1){|r,i|
      puts "#{i}. #{r.name}"
    }
  end
end
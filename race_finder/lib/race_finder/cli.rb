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
    self.calendar = RaceFinder::Calendar.new(type: "My Races")
    race_data = RaceFinder::Scraper.scrape_index("#{BASE_URL}")
    race_data.each {|d|
      self.calendar.races << RaceFinder::Race.new(d)
    }
    #scrape races
    #iterate and add each to calendar
    #self.calendar.races << RaceFinder::Race.new(name: "Crusade 1")
    #self.calendar.races << RaceFinder::Race.new(name: "Crusade 2")
  end
    
  def list_races
    self.calendar.races.each.with_index(1){|r,i|
      puts "#{i}. #{r.name}"
    }
  end
  
  def menu
    input = ""
    while input != "exit"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list"
        list_races
      when "exit"
        puts "Goodbye"
        break
      else
        get_details(input.to_i)
      end
    end
  end
  
  def get_details(index)
    this_race = self.calendar.races[index-1]
    if this_race.description == nil
      this_race.update(RaceFinder::Scraper.scrape_detail("#{BASE_URL}/#{this_race.url}"))
    end
    this_race.show_details
  end
  
end
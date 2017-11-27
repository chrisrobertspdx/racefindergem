class RaceFinder::Race
    attr_accessor :name, :type, :date, :location, :detail, :venue
    def initialize(attr)
        attr.each {|key, value| self.send(("#{key}="), value)}
    end
    def update(attr)
        attr.each {|key, value| self.send(("#{key}="), value)}
    end
    def show_details
       puts "#{self.type.upcase}"
       puts "#{self.name} | #{self.date} | #{self.location}"
       puts "Venue: #{self.venue}"
       puts "---------------"
       puts self.detail
       puts "---------------"
    end
end
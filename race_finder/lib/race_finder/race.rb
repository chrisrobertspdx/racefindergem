class RaceFinder::Race
    attr_accessor :name, :type, :date, :location, :description, :venue, :url
    def initialize(attr)
        attr.each {|key, value| self.send(("#{key}="), value)}
    end
    def update(attr)
        attr.each {|key, value| self.send(("#{key}="), value)}
    end
    def show_details
       puts "#{self.type.upcase}"
       puts "#{self.name} | #{self.date} | #{self.location}"
       puts "---------------"
       puts self.description
       puts "---------------"
    end
end
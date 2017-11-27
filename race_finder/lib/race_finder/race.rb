class RaceFinder::Race
    attr_accessor :name, :type, :date, :location, :detail, :venue
    def initialize(attr)
        attr.each {|key, value| self.send(("#{key}="), value)}
    end
end
class RaceFinder::Calendar
    attr_accessor :races, :type, :region
    def initialize(attr)
        attr.each {|key, value| self.send(("#{key}="), value)}
        @races = []
    end
end
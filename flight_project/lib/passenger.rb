class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        @flight_numbers.each { |flight| return true if flight == str.upcase }
        false
    end

    def add_flight(str)
        if !has_flight?(str)
            @flight_numbers << str.upcase
        end
    end



end
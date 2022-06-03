require_relative "passenger.rb"

class Flight

    def initialize(str, num)
        @flight_number = str.upcase
        @capacity = num
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        return true if @passengers.length == @capacity
        false
    end

    def board_passenger(passenger)
        if self.full? == false && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        passengers.map { |passenger| passenger.name }
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end
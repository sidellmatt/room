require_relative "room.rb"

class Person

    attr_reader :name

    def initialize(name)
        @name = name
        @location = nil
        @location_history = []
    end

    def location=(room)
        if room.is_a?(Room)
            @location = room
            @location_history << room
        else
            @location = nil
        end
    end

    def enter_room(room, time)
        self.location = room
        room.people[@name] << time
    end

    def exit_room(time)
        @location.people[@name] << time
        self.location = nil
    end

end
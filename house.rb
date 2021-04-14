require_relative "person.rb"

class House

    attr_reader :rooms, :people

    def initialize(titles, names)
        @rooms = []
        @people = []
        titles.each { |title| @rooms << Room.new(title) }
        names.each { |name| @people << Person.new(name) }
    end

    def populate
        times = (0..2359).to_a
        @people.each do |person|
            @rooms.each do |room|
                entrance_time = 0
                exit_time = 0
                can_visit_again = exit_time < 2359
                until !can_visit_again
                    if can_visit_again
                        entrance_time = (exit_time..2359).to_a.sample
                        exit_time = (entrance_time + 1..2400).to_a.sample

                        person.enter_room(room, entrance_time)
                        person.exit_room(exit_time)
                        can_visit_again = exit_time < 2359
                    end
                end
            end
        end
    end


end

matt_house = House.new(["Grey Room", "Yellow Room", "Red Room"], ["Matt", "Raffi", "Josh", "Pete"])
matt_house.populate
matt_house.rooms.each do |room|
    puts "#{room.title}: #{room.people}"
    puts "#{room.title} Combined times: #{room.find_common_times}"
    puts ""
end
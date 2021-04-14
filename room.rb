class Room

    attr_reader :title
    attr_accessor :people

    def initialize(title)
        @title = title
        @people = Hash.new { |h, k| h[k] = [] }
    end

    def find_common_times
        combined_times = Hash.new { |h, k| h[k] = [] }

        @people.keys.each_with_index do |person, index|
            (index + 1...@people.length).each do |index_2|
                i = 0
                until i >= @people[@people.keys[index]].length - 1
                    j = 0
                    until j >=  @people[@people.keys[index_2]].length - 1

                        my_entrance = @people[@people.keys[index]][i]
                        my_exit = @people[@people.keys[index]][i + 1]
                        your_entrance = @people[@people.keys[index_2]][j]
                        your_exit = @people[@people.keys[index_2]][j + 1]

                        if my_entrance < your_exit
                            if my_entrance >= your_entrance && my_exit <= your_exit && my_exit >= your_entrance
                                combined_times["#{person} and #{@people.keys[index_2]}"] << [my_entrance, my_exit]
                            elsif my_entrance >= your_entrance && my_exit >= your_exit && my_exit >= your_entrance
                                combined_times["#{person} and #{@people.keys[index_2]}"] << [my_entrance, your_exit]
                            elsif my_entrance <= your_entrance && my_exit <= your_exit && my_exit >= your_entrance
                                combined_times["#{person} and #{@people.keys[index_2]}"] << [your_entrance, my_exit]
                            elsif my_entrance <= your_entrance && my_exit >= your_exit && my_exit >= your_entrance
                                combined_times["#{person} and #{@people.keys[index_2]}"] << [your_entrance, your_exit]
                            else
                                combined_times["#{person} and #{@people.keys[index_2]}"] << []
                            end
                        else
                            combined_times["#{person} and #{@people.keys[index_2]}"] << []
                        end
                        j += 2
                    end
                    i += 2
                end

            end
        end

        combined_times
    end

end
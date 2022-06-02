class HumanPlayer

    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position
        alph = "abcdefghijklmnopqrstuvwxyz"
        puts "player #{@mark} enter two integers with a space between them i.e. 'row col'"
        input = gets.chomp.split(" ")
        if input.length != 2 
            raise "invalid input for position"
        end
        position = [input[0].to_i, input[1].to_i]
    end

end
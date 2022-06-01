class Player

    def get_move
        puts "enter a position with coordinates seperated with a space like `4 7`'"
        input = gets.chomp
        array = [input[0].to_i, input[2].to_i]
    end

end

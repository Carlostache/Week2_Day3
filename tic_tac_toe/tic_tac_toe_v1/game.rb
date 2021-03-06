require_relative "board.rb"
require_relative "human_player.rb"

class Game

    def initialize(mark_1, mark_2)
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        @board = Board.new
        @current = @player_1
    end

    def switch_turn
        if @current == @player_2
            @current = @player_1
        else
            @current = @player_2
        end
    end

    def play
        while @board.empty_positions? == true
            @board.print
            pos = @current.get_position
            @board.place_mark(pos, @current.mark)
            if @board.win?(@current.mark) == true
                puts "Congratulations #{@current.mark}! You Won!!"
                return true
            end
            self.switch_turn
        end

        puts "Draw"
    end

end


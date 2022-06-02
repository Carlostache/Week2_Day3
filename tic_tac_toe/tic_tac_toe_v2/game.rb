require_relative "board.rb"
require_relative "human_player.rb"

class Game

    def initialize(*marks, n)
        @players = []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        @board = Board.new(n)
        @current = @players[0]
    end

    def switch_turn
        @players.rotate!
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


class Board

    def initialize
        @board = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(pos)
        row, col = pos
        return false if row < 0 || col < 0
        return true if @board[row][col] != nil
        false
    end

    def empty?(pos)
        row, col = pos
        return true if @board[row][col] == '_'
        false
    end

    def place_mark(pos, mark)
        row, col = pos
        if valid?(pos) == true && empty?(pos) == true
            @board[row][col] = mark
        else
            raise "invalid position or already taken"
        end
    end

    def print
        @board.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @board.each do |row|
            return true if row.all?(mark)
        end
        false
    end

    def win_col?(mark)
        transposed = @board.transpose
        transposed.each do |col|
            return true if col.all?(mark)
        end
        false
    end

    def win_diagonal?(mark)
        count = 0
        (0...@board.length).each { |i| count += 1 if @board[i][i] == mark }
        return true if count == @board.length

        count = 0
        (0...@board.length).each do |i| 
            count += 1 if @board[@board.length - 1 - i][i] == mark
        end
        return true if count == @board.length

        false
    end

    def win?(mark)
        if win_row?(mark) == true || win_col?(mark) == true || win_diagonal?(mark) == true
            return true
        end
        
        false
    end

    def empty_positions?
        return true if @board.flatten.any?('_')
        false
    end



end
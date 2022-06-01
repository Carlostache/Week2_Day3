class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def num_ships
        count = 0
        @grid.each do |col|
            col.each { |val| count += 1 if val == :S }
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        while num_ships < (@size / 4)
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            position = [ rand_row, rand_col]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        return @grid.map do |subarr| 
            subarr.map do |val| 
                if val == :S
                    val = :N 
                else
                    val
                end
            end 
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end

class Board

    def initialize()
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid? (pos)
        pos.all? { |ele| ele < 3 && ele >= 0 }
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos) 
            self[pos] = mark
        else
            raise "um...thats not, like, a valid move..."
        end
    end







end
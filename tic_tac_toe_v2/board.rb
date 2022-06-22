class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
       

    end

    def valid? (pos)
        pos.all? { |ele| ele < @grid.length && ele >= 0 }
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

    def print
        puts
        puts
        @grid.map.with_index do |ele, i| 
            if i < @grid.length-1
                out = ele.join( "_|_")
                puts "_" + out + "_"
            else
                out = ele.map { |ele| ele == "_" ? " " : ele}.join( " | ")
                puts " " + out + " "
            end
        end
        puts
        puts
    end

    def win_row?(mark)
        @grid.any? {|ele| ele.uniq.length == 1 && ele.uniq[0] == mark }
    end

    def win_col?(mark)
        @grid.transpose.any? {|ele| ele.uniq.length == 1 && ele.uniq[0] == mark}
    end
    
    def win_diagonal?(mark)
        (0...@grid.length).all? do |i| 
            self[[i,i]] == mark
        end || (0...@grid.length).all? do |j|
             @grid.transpose[j][j] == mark
        end
    end
    
    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end


    def empty_positions?
        @grid.flatten.count { |ele| ele == "_"} > 0
    end



end
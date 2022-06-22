class Board
  
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n ** 2
    end

    def [](pos_arr)
        @grid[pos_arr[0]][pos_arr[1]]
    end

    def []=(pos_arr, value)
        @grid[pos_arr[0]][pos_arr[1]] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S}
    end

    def attack(pos_arr)
        if self[pos_arr] == :S
            self[pos_arr] = :H
            puts "\n\nyou sunk my battleship!\n\n"
            return true
        else
            self[pos_arr] = :X
            return false
        end
    end
    require "byebug"

    def place_random_ships
        ship_poses=[]

        while ship_poses.length < (@size / 4 )
            randA = (rand(0...@grid.length))
            randB = (rand(0...@grid.length))
            if !ship_poses.include?([randA,randB])
                ship_poses << [randA,randB]
            end
        end
        ship_poses.each do |position| 
            @grid[position[0]][position[1]] = :S 
        end

    end

    def hidden_ships_grid 
        @grid.map.with_index { |ele, i| ele.map.with_index { |ele2, j| ele2 == :S ? :N : ele2   }}
    end

    def self.print_grid(grid)
        grid.map { |ele| puts ele.join(" ")  }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end




end

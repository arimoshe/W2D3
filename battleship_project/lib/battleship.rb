require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "There are #{@board.num_ships} ships on the board\n\n"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose\n\n"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts "you win\n\n"
            return true
        else
            return false
        end
    end

    def game_over?
        win? || lose?
    end

    def turn
        pos_to_attack = @player.get_move
        did_hit = @board.attack(pos_to_attack)
        puts 
        puts
        @board.print
        
        if !did_hit
           @remaining_misses -=1
           puts "You Have #{@remaining_misses} remaining moves\n\n"
        else
            
        end



    end


end

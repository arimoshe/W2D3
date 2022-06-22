require_relative "./board.rb"
require_relative "./human_player.rb"


class Game 

    def self.get_marks
        puts "On your marks! Player 1, what would you like your mark to be? (one character only)"
        mark1 = gets.chomp
        raise "Please follow the rules" if mark1.length > 1
        puts "Excellent choice!"
        puts  "Player 2, what would you like your mark to be? (one character only)"
        mark2 = gets.chomp
        raise "Please follow the rules" if mark2.length > 1
        puts "Excellent choice!"
        [mark1,mark2]
    end

    def initialize
        marks = Game.get_marks
        @board = Board.new
        @player1 = HumanPlayer.new(marks[0])
        @player2 = HumanPlayer.new(marks[1])
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play 
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Player #{@current_player.mark} has won! 🎉🎉🎉 \n\n\n"
                return ""
            else
                self.switch_turn
            end

        end
        puts "🎺 Wha Wha Whaaaa 🎺 It's a draw!"
        return ""
    end


end
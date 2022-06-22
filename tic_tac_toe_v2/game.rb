require_relative "./board.rb"
require_relative "./human_player.rb"


class Game 

    def self.get_marks_size
        puts "Hello Tic-Tac-Toe-ers! How many players would you like?"
        players = gets.chomp
        raise "Please use a number" if players.split("").any? { |ele| !"0123456789".include?(ele)}
        puts "\n\n\nOn your marks! \n\n\n"
        marks = []
        (1..players.to_i).each do |i|
            puts  "Player #{i}, what would you like your mark to be? (one character only)\n\n\n"
            mark = gets.chomp
            raise "Please use only one character" if mark.length > 1
            marks << mark
            puts "\n\n\nExcellent choice!\n\n\n"
        end
        puts "Please choose a board size.\n\n\n"
        size = gets.chomp
        raise "Please use a number" if size.split("").any? { |ele| !"0123456789".include?(ele)}
        [size.to_i,marks]
    end

    def initialize
        marks_size = Game.get_marks_size
        @board = Board.new(marks_size[0])
        @players = marks_size[1].map {|ele| HumanPlayer.new(ele)}
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
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
require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"


class Game 

    def self.get_marks_size
        begin
        puts "Hello Tic-Tac-Toe-ers! How many human players would you like? (minimum 1)"
        human_players = gets.chomp
        raise "Please use a number" if human_players.split("").any? { |ele| !"0123456789".include?(ele)}
        puts "How many computer players would you like?"
        computer_players = gets.chomp
        raise "Please use a number" if computer_players.split("").any? { |ele| !"0123456789".include?(ele)}
        chars = "0123456789".split("") + (0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a + "!@#$%^&*()_-+={[]}|\\\"';:/?.>,<`~".split("")
        puts "\n\n\nOn your marks! \n\n\n"
        human_marks = []


        unless human_players.to_i == 0
            (1..human_players.to_i).each do |i|
                puts  "Player #{i}, what would you like your mark to be? (one character only)\n\n\n"
                mark = gets.chomp
                raise "\n\n\nPlease use only one character\n\n\n" if mark.length > 1 
                raise "\n\n\nPlease use a unique character\n\n\n" if human_marks.include?(mark)
                human_marks << mark
                puts "\n\n\nExcellent choice!\n\n\n"
            end
        end
        human_marks.each do |ele| 
            if ele == chars[0]
                chars.shift
            else
                chars = chars[0...chars.index(ele)] + chars[(chars.index(ele)+1)..-1]
            end
        end
        computer_marks = []
        computer_players.to_i.times do
            char = chars[rand(0...chars.length)]
            computer_marks << char
            if char == chars[0]
                chars.shift
            else
                chars = chars[0...chars.index(char)] + chars[(chars.index(char)+1)..-1]
            end
        end
        puts "Please choose a board size.\n\n\n"
        size = gets.chomp
        raise "Please use a number" if size.split("").any? { |ele| !"0123456789".include?(ele)}
        marks_hash = {}
        human_marks.each { |ele| marks_hash[ele] = "human" }
        computer_marks.each { |ele| marks_hash[ele] = "computer" }
        return [size.to_i, marks_hash]
        rescue RuntimeError => e
            puts e.message
            retry
        end
    end

    def initialize
        marks_size = Game.get_marks_size
        @board = Board.new(marks_size[0])
        @players = []
        marks_size[1].each { |k,v| v == "human" ? @players << HumanPlayer.new(k) : @players << ComputerPlayer.new(k)  }
        @current_player = @players[0]
        return ""
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play 
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
            @board.place_mark(pos, @current_player.mark)
            sleep(0.5)
            if @board.win?(@current_player.mark)
                @board.print
                puts "Player #{@current_player.mark} has won! 🎉🎉🎉 \n\n\n"
                return ""
            else
                self.switch_turn
            end

        end
        @board.print
        puts "🎺 Wha Wha Whaaaa 🎺 It's a draw!"
        return ""
    end


end
require_relative "code"

class Mastermind

    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(inst)
        puts "You have #{inst.num_exact_matches(@secret_code)} exact matches\n\n\n"
        puts "You have #{inst.num_near_matches(@secret_code)} correct color, incorrect location matches\n\n\n"
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        my_inst = Code.from_string(input)
        self.print_matches(my_inst)
        my_inst == @secret_code
    end


end

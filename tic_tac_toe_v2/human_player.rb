class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "\n\nHello Player #{self.mark}\n\nPlease enter a position in the form of 'row column' \n(no quotes & positions start at 0)\n\n"
        input = gets.chomp
        invalidChars = ("a".."z").to_a + ("A".."Z").to_a + "!@#$%^&*()_-+={[]}|\\\"';:/?.>,<`~".split("")
        numbersString = "0123456789" 
        if input.split("").any? { |ele| invalidChars.include?(ele)} || input.split("").count { |ele| ele == " "} != 1|| input[0] == " " || input[-1] == " " || input.length < 3
            raise "Ah ah ah, you didn't say the magic word"
        else
            input.split(" ").map {|ele| ele.to_i}
        end
    end




end
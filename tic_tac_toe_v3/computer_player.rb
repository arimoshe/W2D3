class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_position(legal_positions)
        legal_positions[rand(0...legal_positions.length)]
    end

end

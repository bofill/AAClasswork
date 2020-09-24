require_relative 'piece.rb'
require_relative "../modules/slideable.rb"

class Queen < Piece
    include Slideable
    
    def symbol
    '♛'.colorize(color)
    end

    def move_dirs

    end

    def to_s
        :Q
    end

    def inspect
        self.symbol
    end
    
end
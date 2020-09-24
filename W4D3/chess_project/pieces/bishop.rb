require_relative './piece.rb'
require_relative "../modules/slideable.rb"

class Bishop < Piece
    include Slideable

    def symbol
        '♝'.colorize(color)
     end

    def to_s
        :B
    end

    def move_dirs

    end
    
    def inspect
        self.symbol
    end


    
end

# bishop1 = Bishop.new(:white,"board",[7,2])
# p bishop1.color
# p bishop1.pos
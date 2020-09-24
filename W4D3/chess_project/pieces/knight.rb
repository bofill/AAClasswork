require_relative 'piece.rb'
require_relative "../modules/stepable.rb"

class Knight < Piece
    include Stepable

    def symbol
    '♞'.colorize(color)
  end

    def to_s
        :H
    end

    def move_diffs

    end

    def inspect
        self.symbol
    end

    
end
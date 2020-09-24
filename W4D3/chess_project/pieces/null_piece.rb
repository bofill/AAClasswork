require_relative './piece.rb'
require 'singleton.rb'

class NullPiece < Piece
    include Singleton
    attr_reader :symbol, :color

    def initialize

    end
    
    def symbol
        @symbol = " "
    end

    def color
        @color = :none
    end

    def empty?
        true
    end

    def moves
        []
    end

    def to_s
        self.symbol
    end

    def inspect
        @symbol
    end
    
end

# p null1 = NullPiece.instance
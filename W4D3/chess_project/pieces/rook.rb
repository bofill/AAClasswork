require_relative 'piece.rb'
require_relative "../modules/slideable.rb"
require 'colorize'

class Rook < Piece
    include Slideable

    
    def symbol
        '♜'.colorize(@color)
    end

    # def symbol
    #     :R
    # end

    def to_s
        :R
    end

    def move_dirs

    end

    def inspect
        self.symbol
    end

    
end


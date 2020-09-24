require_relative 'piece.rb'


class Pawn < Piece

    
    def symbol
        '♟️'.colorize(color)
    end

    def move_dirs

    end

    def at_start_row?

    end


    def to_s
        :P
    end

    def inspect
        self.symbol
    end

    private
    def forward_dir

    end

    def forward_steps

    end

    def side_attacks

    end

    
end
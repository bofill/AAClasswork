

class Piece
    
    attr_reader :color, :pos
    attr_accessor :board

    def initialize(blk_wht, board, pos)
        @color = blk_wht
        @board = board
        @pos = pos #[x,y]
    end


    def to_s 
        @color
    end



    def empty?
        @pos == NullPiece
    end

    def valid_moves
    end

    def pos=(val)
        row, col = val
        @board.rows[row][col] = val
    end

    def color
        @color
    end

    # def inspect
    #     @symbol
    # end



    private
    def move_into_check?(end_pos)
    end
end

# RB1   RB2   RB3   RB4

# B / W 

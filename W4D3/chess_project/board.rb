require_relative './pieces/all_pieces.rb'
require "byebug"
class Board
    attr_reader :sentinal, :rows
    attr_writer :rows

    def initialize 

        sentinal = NullPiece.instance
        @rows = Array.new(8) {[sentinal] * 8}
        
        make_pieces
        render
        # debugger
    end

    def render
        self.rows.each do |row|
            row.each do |piece|
                print piece.symbol
            end
            puts
            # puts row.join(" ")
        end

        # rows.each do |subA|
        #     subA.each do |piece|
        #         if piece.class == NullPiece
        #             puts "We have Null Piece"
        #         else
        #             "Rook or other"
        #             # puts piece.symbol
        #     # puts row.symbol.join("_")
        #         end
        #     end
        # end
    end
    
    def make_pieces
        blk_row1 =[
            Rook.new(:black,  self , [0,0]),
            Knight.new(:black, self,  [0,1]),
            Bishop.new(:black, self,  [0,2]),
            Queen.new(:black, self,   [0,3]),
            King.new(:black, self,    [0,4]),
            Bishop.new(:black, self,  [0,5]),
            Knight.new(:black, self,  [0,6]),
            Rook.new(:black, self,    [0,7])
        ]
        blk_row2 =
            (0..7).map do |i|
                Pawn.new(:black, self,[1,i])
            end

      
        # wht_row7 =
        #     (0..7).map do |i|
        #         Pawn.new(:white, self,[6,i])
        #     end




        
        wht_row8 =[
            Rook.new(:white,  self , [7,0]),
            Knight.new(:white,self,  [7,1]),
            Bishop.new(:white,self,  [7,2]),
            Queen.new(:white,self,   [7,3]),
            King.new(:white,self,    [7,4]),
            Bishop.new(:white,self,  [7,5]),
            Knight.new(:white,self,  [7,6]),
            Rook.new(:white,self,    [7,7])
        ]

        (0..7).each do |y|
            (0..7).each do |x|
                if y == 0
                    @rows[y][x] = blk_row1[x]
                elsif y == 1
                    @rows[y][x] = blk_row2[x]
                # elsif y == 6
                #     @rows[y][x] = wht_row7[x]
                elsif y == 7
                    @rows[y][x] = wht_row8[x]
                end
            end
        end

        return true

    end

    private
    attr_reader :sentinel


end
# b = Board.new
# bishop = b.rows[7][2]
# p bishop.pos
# p bishop.color
# p bishop.grow_unblocked_moves_in_dir(bishop.pos[0])
class Board

    def initialize
        @size = 8
        @board = Array.new(8) {Array.new(8, [])}
    end

    attr_reader :size, :board

    def printer
       @board.map { |row| puts row}
    end

    def [](pos)
        row,col = pos
        @board[row][col]
    end

    def []=(pos, mark)
        row,col = pos
        @board[row][col] = mark
    end


end

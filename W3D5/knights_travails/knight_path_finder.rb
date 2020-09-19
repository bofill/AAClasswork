require_relative "board"
require_relative "PolyTreeNode"

class KnightPathFinder
    # MOVES = {[2,1][2,-1][]}
    # MOVES = {[[row - 2][col + 1]}
    # MOVES [[1,2][2,1]] pos(3,3) new_pos= pos[0] +move[0]

    MOVES = [
        [2,1], 
        [2,-1],
        [1,2],
        [1,-2],
        [-1,2],
        [-1,-2],
        [-2,1],
        [-2,-1]
    ]

    def self.valid_moves(start)
        possible_moves = new_pos(start).select do |move| 
            row, col = move
            (0..7).include?(row) && (0..7).include?(col)
        end
        possible_moves
    end

    def new_pos(pos)
        start = pos
        MOVES.each do |move|
            row,col = move 
            row_start,col_start = start
            pos_new = [row+ row_start, col+ col_start]
            new_positions << pos_new 
        end
        new_positions
    end

    def initialize(position)
        @start_pos = position
    end

    attr_reader :start_pos

    def build_move_tree()
        
    end

    def find_path(end_pos)
        row,col = end_pos
        #supposed to use dfs and bfs to find the shortest path
    end

    def trace_path_back()

    end
end
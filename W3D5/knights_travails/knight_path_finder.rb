require_relative "board"
require_relative "poly_tree_node"
require "byebug"

class KnightPathFinder

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
        new_positions = []
        MOVES.each do |move|
            row,col = move 
            row_start,col_start = start
            pos_new = [row + row_start, col + col_start]
            new_positions << pos_new if (0..7).include?(row) && (0..7).include?(col)
        end
        new_positions
    end

    
    attr_reader :start_pos, :considered_positions

    def initialize(position)
        @start_pos = PolyTreeNode.new(position) 
        @considered_positions = [@start_pos]
        build_move_tree
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos).select {|pos| @considered_positions.include?(pos)}
        @considered_positions += new_positions
        return new_positions
    end
    
    #build all possible positions from the root
    def build_move_tree()
        queue = [@start_pos]

        until queue.empty?
            current_pos = queue.shift
            new_positions = new_move_positions(current_pos.value)
            new_move_positions.each do |new_pos| #all new possitions are child of new node
                child = PolyTreeNode.new(new_pos)
                current_pos.add_child(child)
                queue << child
            end
        end
    end

    def find_path(end_pos)
        row,col = end_pos
        #supposed to use dfs and bfs to find the shortest path
    end

    def trace_path_back()

    end
end
require_relative "knight_path_finder"
require "byebug"
class PolyTreeNode
    # include Searchable

    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil #parent
        @children = [] #children
        
    end

    def parent=(new_parent_node)
        old_parent = @parent
        old_parent.children.delete(self) if !old_parent.nil?
        @parent = new_parent_node
        @parent.children << self if !new_parent_node.nil?
    end

    # def point_of_origin=(new_point_of_origin_node)
    #     old_point_of_origin = @point_of_origin
    #     old_point_of_origin.potential_moves.delete(self) if !old_point_of_origin.nil?
    #     @point_of_origin = new_point_of_origin_node 
    #     @point_of_origin.potential_moves.push(self) if !new_point_of_origin_node.nil? 
    # end

    def add_child(child)
        child.point_of_origin = self
    end

    # def add_move(move)
    #     move.point_of_origin = self #should be recording new possible moves
    # end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "node is not a move"
        end 
        child.parent = nil
    end

    def dfs(target_value)
        return self if target_value == self.value
        potential_moves.each do |move|
            result = move.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        nodes = [self]  
        until nodes.empty?
            node = nodes.shift
            if node.value == target_value
                return node                
            end
            nodes.concat(node.potential_moves)
        end
        nil
    end

    def inspect
        @first_positon
    end
end


# Breadth-first search pseudocode
  # uses a Queue data structure, so we solve using iteration (check queue until it's empty)
# def bfs(root, target)
  # create a queue
  # add root node to queue
  # until the queue is empty:
    # take the first node from the queue
    # check given node's value
      # if node's value matches the target, return the node object
      # otherwise, put moveren (if any) into the queue
    # continue processing each node in the queue in FIFO fashion (loop back to line 47)
  
  # if we haven't returned after searching whole tree, return nil (b/c the target isn't in the tree)

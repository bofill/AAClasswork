
require "byebug"
class PolyTreeNode
    # include Searchable

    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent_node)
        old_parent = @parent # save old_parent to a new variable
        old_parent.children.delete(self) if !old_parent.nil? #delete the moving node from old parent
        @parent = new_parent_node #set parent to new parent
        @parent.children.push(self) if !new_parent_node.nil? #add the children to new parent's children 
    end

    def add_child(child)
        child.parent = self 
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "node is not a child"
        end 
        child.parent = nil
    end

    def dfs(target_value)
        return self if target_value == self.value
        children.each do |child|
            result = child.dfs(target_value)
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
            nodes.concat(node.children)
        end
        nil
    end

    def inspect
        @value
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
      # otherwise, put children (if any) into the queue
    # continue processing each node in the queue in FIFO fashion (loop back to line 47)
  
  # if we haven't returned after searching whole tree, return nil (b/c the target isn't in the tree)

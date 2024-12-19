require_relative 'node'

# Manages the binary tree serving as the "orchestrator" that interacts with Node objects
class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    @root = root
  end

  def build_tree
    sorted_arr = @arr.sort.uniq
    new_node = Node.new(sorted_arr)
    
    @root = new_node.sorted_array_to_BST(sorted_arr)
    new_node.pre_order(@root)

    puts "\nroot of this tree is: #{@root.data}"
  end

  def insert_node(data)
    @root.insert(@root, data)
  end

  def delete(data)
    @root.delete(@root, data)
  end

  def find(data)
    @root.find_node(@root, data)
  end

  def lever_order
    @root.level_order(@root)

    # @root.level_order(@root) { |node| "%0.2f" % node }      
  end

  def pre_order
    result = @root.pre_order(@root)
    return result.inspect

    # @root.pre_order(@root) { |node| puts "%0.2f" % node }
  end

  def inorder
    result = @root.inorder(@root)
    return result.inspect

    # @root.inorder(@root) { |node| puts "%0.2f" % node }
  end

  def post_order
    result = @root.post_order(@root)
    return result.inspect

    # @root.post_order(@root) { |node| puts "%0.2f" % node}
  end

  def heigh(data)
    @root.height_of_node(@root, data)    
  end

  def depth(data)
    @root.depth(@root, data)
  end

  def balanced?
    @root.balanced?(@root)
  end

  def rebalance
    @root = @root.rebalance(@root)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
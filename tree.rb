require_relative 'node'

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
    @root.pre_order(@root)
    @root.inorder(@root)
    @root.post_order(@root)
  end

  def delete(data)
    @root.del_node(@root, data)
  end

  def find(data)
    @root.find_node(@root, data)
  end

  def lever_order_
    @root.level_order(@root)

    # @root.level_order(@root) { |node| "%0.2f" % node }      
  end

  def pre_order_
    result = @root.pre_order(@root)
    puts result.inspect

    # @root.pre_order(@root) { |node| puts "%0.2f" % node }
  end

  def inorder_
    result = @root.inorder(@root)
    puts result.inspect

    # @root.inorder(@root) { |node| puts "%0.2f" % node }
  end

  def post_order_
    result = @root.post_order(@root)
    puts result.inspect

    # @root.post_order(@root) { |node| puts "%0.2f" % node}
  end

  def heigh_(data)
   puts @root.height_of_node(@root, data)    
  end

  def depth_(data)
    puts @root.depth(@root, data)
  end

  def balanced_?
    @root.balanced?(@root)
  end

  def rebalance_
    @root = @root.rebalance(@root)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
require_relative 'node'

class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    @root = root
  end

  def built_tree
    sorted_arr = @arr.sort.uniq
    new_node = Node.new(sorted_arr)
    
    @root = new_node.sorted_array_to_BTS(sorted_arr)
    new_node.pre_order(@root)

  end
end
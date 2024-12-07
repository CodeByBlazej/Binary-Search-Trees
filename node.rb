class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = left
    @right = right
  end

  def sorted_arr_to_BST(arr, first, last)
    return nil if first > last

    mid = first + (last - first) / 2

    root = Node.new(arr[mid])

    root.left = sorted_arr_to_BST(arr, first, mid - 1)

    root.right = sorted_arr_to_BST(arr, mid + 1, last)

    return root
  end

  def sorted

end

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = left
    @right = right
  end

  def sorted_arr_to_BST_recur(arr, first, last)
    return nil if first > last

    mid = first + (last - first) / 2

    root = Node.new(arr[mid])

    root.left = sorted_arr_to_BST_recur(arr, first, mid - 1)

    root.right = sorted_arr_to_BST_recur(arr, mid + 1, last)

    return root
  end

  def sorted_array_to_BST(arr)
    return sorted_arr_to_BST_recur(arr, 0, arr.size - 1)
  end

  def pre_order(root)
    return if root.nil?

    puts root.data
    pre_order(root.left)
    pre_order(root.right)
  end

  def insert(root, data)
    if root == nil
      return Node.new(data)
    end

    if root.data == data
      return root
    end

    if data < root.data
      root.left = insert(root.left, data)
    elsif data > root.data
      root.right = insert(root.right, data)
    end

    return root
  end

  def inorder(root)
    if root != nil
      inorder(root.left)
      puts root.data
      inorder(root.right)
    end
  end

end

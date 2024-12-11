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

  def getSuccessor(curr)
    curr = curr.right

    while curr != nil && curr.left != nil
      curr = curr.left
    end

    return curr
  end

  def del_node(root, x)
    if root == nil
      return root
    end

    if root.data > x
      root.left = del_node(root.left, x)
    elsif root.data < x
      root.right = del_node(root.right, x)
    else
      if root.left == nil
        return root.right
      end

      if root.right == nil
        return root.left
      end

      succ = getSuccessor(root)
      root.data = succ.data
      root.right = del_node(root.right, succ.data)
    end
    
    return root
  end

  def find_node(root, x)
    if root == nil
      return
    end

    if root.data == x
      puts root.data
      return
    end

    find_node(root.left, x)
    find_node(root.right, x)
  end

  def lever_order(root)
    arr = []

    if root == nil
      return
    end

    arr << yield(root.data)
    while arr != nil
      root.data = arr[0]
      puts root.data
      arr << root.left if root.left != nil
      arr << root.right if root.right != nil
      arr.shift
    end
  end
end

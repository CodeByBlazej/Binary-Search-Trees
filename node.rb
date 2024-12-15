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

  # Commented code is correct when used without block
  def level_order(root)
    # queue = [root]
    # result = []

    # until queue.empty?
    #   result << queue.first.data
    #   queue << queue.first.left if queue.first.left != nil
    #   queue << queue.first.right if queue.first.right != nil
    #   queue.shift
    # end

    # puts result
    # return result

    queue = [root]
    result = []

    until queue.empty?
      
      if block_given?
        puts yield(queue.first.data)
      else
        result << queue.first.data
      end
      
      queue << queue.first.left if queue.first.left != nil
      queue << queue.first.right if queue.first.right != nil
      queue.shift
    end

    puts result unless block_given?
  end

  def pre_order(root, result = [], &block)
    return if root.nil?

    if block_given?
      yield(root.data)
    else
      result << root.data
    end
    pre_order(root.left, result, &block)
    pre_order(root.right, result, &block)

    return result unless block_given?
  end

  def inorder(root, result = [], &block)
    return if root.nil?

    inorder(root.left, result, &block)
    if block_given?
      yield(root.data)
    else
      result << root.data
    end
    inorder(root.right, result, &block)

    return result unless block_given?
  end

  def post_order(root, result = [], &block)
    return if root.nil?

    post_order(root.left, result, &block)
    post_order(root.right, result, &block)
    if block_given?
      yield(root.data)
    else
      result << root.data
    end
    
    return result unless block_given?   
  end

  def height(root)
    return -1 if root.nil?

    left_height = height(root.left)
    right_height = height(root.right)

    [left_height, right_height].max + 1
  end

  def height_of_node(root, x)
    return -1 if root.nil?

    if root.data == x
      return height(root)
    end

    left_result = height_of_node(root.left, x)
    return left_result if left_result != -1

    height_of_node(root.right, x)
  end

  def depth(root, x)
    return -1 if root.nil?

    return 0 if root.data == x

    if x < root.data
      left_depth = depth(root.left, x)
      return - 1 if left_depth == -1
      return left_depth + 1
    end

    if x > root.data
      right_depth = depth(root.right, x)
      return -1 if right_depth == -1
      return right_depth + 1
    end
  end


end

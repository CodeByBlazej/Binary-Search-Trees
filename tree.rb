require_relative 'node'

class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    @root = root
  end

  def built_tree(arr)
    sorted_arr = arr.sort.uniq
    puts sorted_arr
  end
end
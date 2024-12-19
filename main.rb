# Main file, entry point to use Tree and Node classes. Tree is built, manipulated and displayed here
require_relative 'tree'

tree = Tree.new(Array.new(7) { rand(10..70) })
tree.build_tree
tree.pretty_print
p tree.lever_order
puts tree.pre_order
puts tree.post_order
puts tree.inorder

tree.insert_node(5)
tree.insert_node(100)
tree.insert_node(102)

tree.pretty_print
puts tree.balanced?
tree.rebalance
tree.pretty_print
puts tree.balanced?

p tree.lever_order
puts tree.pre_order
puts tree.post_order
puts tree.inorder
puts tree.heigh(5)
puts tree.depth(5)


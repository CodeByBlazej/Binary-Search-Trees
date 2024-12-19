# Main file, entry point to use Tree and Node classes. Tree is built, manipulated and displayed here
require_relative 'tree'

tree = Tree.new(Array.new(7) { rand(10..70) })
tree.build_tree
tree.pretty_print
p tree.lever_order_
tree.pre_order_
tree.post_order_
tree.inorder_

tree.insert_node(5)
tree.insert_node(100)
tree.insert_node(102)

tree.pretty_print
puts tree.balanced_?
tree.rebalance_
tree.pretty_print
puts tree.balanced_?

p tree.lever_order_
tree.pre_order_
tree.post_order_
tree.inorder_

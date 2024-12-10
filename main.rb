require_relative 'tree'

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree.build_tree

tree.pretty_print

tree.insert_node(6)
tree.pretty_print

tree.insert_node(4568)
tree.pretty_print

tree.delete(9)
tree.pretty_print

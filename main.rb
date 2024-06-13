require_relative "lib/node"
require_relative "lib/tree"
require "pry-byebug"

a = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts a.root
puts a.root.value
puts a.root.left
puts a.root.right
a.insert(5)
a.insert(100)

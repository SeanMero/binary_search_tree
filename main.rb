require_relative "lib/node"
require_relative "lib/tree"
require "pry-byebug"

test = Tree.new
test.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

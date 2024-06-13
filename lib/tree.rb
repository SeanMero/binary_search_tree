# class and methods for a binary search tree
class Tree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr) # rubocop:disable Metrics/AbcSize
    # sort array and remove duplicates
    arr.sort!.uniq!

    # base case and then recursion
    return Node.new(arr[0]) if arr.length <= 1

    mid = (arr.length - 1) / 2 # rubocop:disable Lint/AmbiguousOperatorPrecedence

    root_node = Node.new(arr[mid])
    root_node.left = build_tree(arr[0..mid])
    root_node.right = build_tree(arr[(mid + 1)..])

    # return the root node
    root_node
  end

  def insert(val, node = root)
    if val == node.value
      puts "This value is already in the tree."
    elsif val < node.value
      node.left.nil? ? node.left = Node.new(val) : insert(val, node.left)
    else val > node.value
      node.right.nil? ? node.right = Node.new(val) : insert(val, node.right)
    end
  end
end

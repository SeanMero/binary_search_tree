# class and methods for a binary search tree
class Tree
  attr_accessor :root

  def build_tree(arr) # rubocop:disable Metrics/AbcSize
    # sort array and remove duplicates
    return nil if arr.empty?
    arr.sort!.uniq!

    # identify start, end, and mid

    return Node.new(arr[0]) if arr.length <= 1

    last = arr.length - 1
    mid = 0 + last / 2

    root = Node.new(arr[mid])
    root.left = build_tree(arr[0..(mid)])
    root.right = build_tree(arr[(mid + 1)..])

    # return the root node
    root
  end
end

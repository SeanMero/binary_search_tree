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

    mid = (arr.length) / 2

    root_node = Node.new(arr[mid])
    root_node.left = build_tree(arr[0..(mid - 1)])
    root_node.right = build_tree(arr[(mid + 1)..])

    # return the root node
    root_node
  end

  def insert(val, node = root)
    if val == node.value
      puts "This value is already in the tree."
    elsif val < node.value
      node.left.nil? ? node.left = Node.new(val) : insert(val, node.left)
    else
      node.right.nil? ? node.right = Node.new(val) : insert(val, node.right)
    end
  end

  def delete(val, node = root)
    if val == node.value
      if node.left.nil? && node.right.nil?
        node = nil
      elsif node.left.nil?
        node = node.right
      elsif node.right.nil?
        node = node.left
      else
        node.right.left.nil? ? node = node.right : node = find_left(node)
      end
    else
      val < node.value ? delete(val, node.left) : delete(val, node.right)
    end
  end

  def find_left(node)
    if node.left.nil?
      return node
    else
      find_left(node.left)
    end
  end

  def find(val, node = root)
    return node if node.nil? || val == node.value

    val < node.value ? find(val, node.left) : find(val, node.right)
  end
end

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

  def level_order(node = root)
    queue = [node]
    answer = []
    while queue.length.positive?
      queue.push(queue[0].left) unless queue[0].left.nil? || queue[0].nil?
      queue.push(queue[0].right) unless queue[0].right.nil? || queue[0].nil?
      if block_given?
        answer.push(queue[0].value) if yield(node)
      else
        answer.push(queue[0].value)
      end
      queue.shift
    end
    answer
  end

  def preorder(node = root)
    return if node.nil?

    if block_given?
      puts node.value if yield(node)
    else
      puts node.value
    end
    preorder(node.left)
    preorder(node.right)
  end

  def inorder(node = root)
    return if node.nil?

    inorder(node.left)
    if block_given?
      puts node.value if yield(node)
    else
      puts node.value
    end
    inorder(node.right)
  end

  def postorder(node = root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    if block_given?
      puts node.value if yield(node)
    else
      puts node.value
    end
  end

  def height(node = root, count = 0)
    count += 1
    height_score = count if count > height_score
    return if node.nil?

    height(node.left, count)
    height(node.right, count)
    height_score
  end

  def depth(node1, node2 = root, count = 0)
    height(node2, count) - height(node1, count)
  end

  def balanced?(node = root, collector = [])
    return if node.nil?

    if node.left.nil && node.right.nil?
      collector.push(depth(node))
    else
      balanced?(node.left, collector)
      balanced?(node.right, collector)
    end
    collector.max - collector.min > 1 ? return false : return true
  end

  def rebalance!
    arr = []
    arr.push(inorder)
    root = build_tree(arr)
  end
end

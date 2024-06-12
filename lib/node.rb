# class and methods for binary search tree nodes
class Node
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  include Comparable

  def <=>(other)
    value <=> other.value
  end
end
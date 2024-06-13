# class and methods for binary search tree nodes
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  include Comparable

  def <=>(other)
    value <=> other.value
  end
end

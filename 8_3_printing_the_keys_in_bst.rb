class Node
  attr_accessor :key, :left, :right
  def initialize(key, hash = {})
    @key = key
    @left = hash[:left]
    @right = hash[:right]
  end
end

# BST in p.105
D = Node.new(2)
E = Node.new(5)
C = Node.new(3, left: D, right: E)
H = Node.new(13)
G = Node.new(17, left: H)
F = Node.new(11, right: G)
B = Node.new(7, left: C, right: F)
M = Node.new(31)
L = Node.new(29, right: M)
N = Node.new(41)
K = Node.new(37, left: L, right: N)
J = Node.new(23, right: K)
P = Node.new(53)
O = Node.new(47, right: P)
I = Node.new(43, left: J, right: O)
A = Node.new(19, left: B, right: I)

# print in sorted order
# no recursion
def print_bst(node)
  result = []
  stack = []
  stack.push(left: node.left, middle: node, right: node.right)
  while !stack.empty?
    last = stack.last
    if stack[-1][:left]
      n = stack[-1][:left]
      stack[-1][:left] = nil
      stack.push(left: n.left, middle: n, right: n.right)
    else
      n = stack.pop
      result.push(n[:middle].key)
      if n[:right]
        n = n[:right]
        stack.push(left: n.left, middle: n, right: n.right)
      end
    end
  end
  result
end

# from solution
def p_bst(node)
  result = []
  stack = []
  curr = node

  while !stack.empty? || curr
    if curr
      stack.push(curr)
      curr = curr.left
    else
      popped = stack.pop
      result.push(popped.key)
      curr = popped.right
    end
  end
  result
end

p print_bst A
p p_bst A

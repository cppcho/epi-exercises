class Node
  attr_accessor :key, :left, :right
  def initialize(key, hash = {})
    @key = key
    @left = hash[:left]
    @right = hash[:right]
  end
end

# BST in p.73
D = Node.new(28)
E = Node.new(0)
C = Node.new(271, left: D, right: E)
H = Node.new(17)
G = Node.new(3, left: H)
F = Node.new(561, right: G)
B = Node.new(6, left: C, right: F)
M = Node.new(641)
L = Node.new(401, right: M)
N = Node.new(257)
K = Node.new(1, left: L, right: N)
J = Node.new(2, right: K)
P = Node.new(28)
O = Node.new(271, right: P)
I = Node.new(6, left: J, right: O)
A = Node.new(314, left: B, right: I)

def print_level(root_node)
  result = []
  q = Queue.new
  q.enq(root_node)
  while !q.empty?
    n = q.deq
    q.enq(n.left) if n.left
    q.enq(n.right) if n.right
    result.push(n.key)
  end
  result
end

p print_level(A)

# Binary tree with parent field

class Node
  attr_accessor :key, :left, :right, :parent
  def initialize(key, hash = {})
    @key = key
    @left = hash[:left]
    @right = hash[:right]
    @parent = hash[:parent]
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

D.parent = C
E.parent = C
C.parent = B
H.parent = G
G.parent = F
F.parent = B
B.parent = A
I.parent = A
J.parent = I
O.parent = I
K.parent = J
L.parent = K
N.parent = K
M.parent = L
O.parent = I
P.parent = O

# MY SOLUTION!! used 3 POMODORO
def inorder_traversal(root_node)
  result = []
  curr_node = root_node
  left_ok = false
  while curr_node
    if !left_ok
      curr_node = curr_node.left while curr_node.left
    end
    result.push(curr_node.key)
    if curr_node.right
      curr_node = curr_node.right
      left_ok = false
    else
      while curr_node.parent && curr_node.parent.right == curr_node
        curr_node = curr_node.parent
      end
      curr_node = curr_node.parent
      left_ok = true
    end
  end
  result
end

# didn't think of using prev_node / next node..
def solution(root_node)
  result = []
  curr_node = root_node
  prev_node = nil
  next_node = nil
  while curr_node
    if !prev_node || prev_node.left == curr_node || prev_node.right == curr_node
      if curr_node.left
        next_node = curr_node.left
      else
        result.push(curr_node.key)
        next_node = curr_node.right ? curr_node.right : curr_node.parent
      end
    elsif curr_node.left == prev_node
      result.push(curr_node.key)
      next_node = curr_node.right ? curr_node.right : curr_node.parent
    else
      next_node = curr_node.parent
    end

    prev_node = curr_node
    curr_node = next_node
  end
  result
end

p inorder_traversal(A)
p solution(A)

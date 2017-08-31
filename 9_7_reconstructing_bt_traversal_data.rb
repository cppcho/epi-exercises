class Node
  attr_accessor :key, :left, :right, :parent
  def initialize(key, hash = {})
    @key = key
    @left = hash[:left]
    @right = hash[:right]
    @parent = hash[:parent]
  end

  def print_tree

  end
end

# by recursion
# assume distinct key

def reconstruct(inorder, preorder)
  root_key = preorder.first
  return nil if root_key.nil?
  root_key_index_in_inorder = inorder.find_index(root_key)
  raise "error" if root_key_index_in_inorder.nil?
  left_inorder = root_key_index_in_inorder > 0 ? inorder[0..(root_key_index_in_inorder - 1)] : []
  right_inorder = inorder[(root_key_index_in_inorder + 1)..-1]
  left_preorder = preorder[1, left_inorder.length]
  right_preorder = preorder[1 + left_inorder.length, right_inorder.length]

  left_node = reconstruct(left_inorder, left_preorder)
  right_node = reconstruct(right_inorder, right_preorder)

  Node.new(root_key, left: left_node, right: right_node)
end

inorder = ['F', 'B', 'A', 'E', 'H', 'C', 'D', 'I', 'G']
preorder = ['H', 'B', 'F', 'E', 'A', 'C', 'D', 'G', 'I']

root = reconstruct(inorder, preorder)


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

p print_level(root)

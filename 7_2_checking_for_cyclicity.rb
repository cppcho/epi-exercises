require "./lib/linkedlist"

# see solution

def check(head_node)
  curr_node = head_node.next
  curr_node = curr_node.next while curr_node && curr_node != head_node
  curr_node
end

l = LinkedList.new(arr: [2, 5, 7])
p check(l.first_node)
l.first_node.next.next = l.first_node
p check(l.first_node)

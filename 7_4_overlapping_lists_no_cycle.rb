# O(1) storage

# my ans
def get_common_node(l1, l2)
  # find last nodes (actually no need to find if the last node is same)
  length_1 = length_2 = 0
  last_node_1 = n1 = l1.first_node
  last_node_2 = n2 = l2.first_node
  while n1
    length_1 += 1
    last_node_1 = n1
    n1 = n1.next
  end
  while n2
    length_2 += 1
    last_node_2 = n2
    n2 = n2.next
  end

  if last_node_1 == last_node_2 # this check is not needed
    n1 = l1.first_node
    n2 = l2.first_node
    if length_1 > length_2
      [0...(length_1 - length_2)].each do
        n1 = n1.next
      end
    elsif length_1 < length_2
      [0...(length_2 - length_1)].each do
        n2 = n2.next
      end
    end
    while n1 && n2
      return n1 if n1 == n2
      n1 = n1.next
      n2 = n2.next
    end
  end
  nil
end

l = LinkedList.new(arr: [2, 5, 7, 13])
f = LinkedList.new(arr: [1, 3, 11])

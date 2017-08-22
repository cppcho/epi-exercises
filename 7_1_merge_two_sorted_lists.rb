class Node
  attr_accessor :data, :next
  def initialize(data, n = nil)
    @data = data
    @next = n
  end
end

class LinkedList
  attr_reader :first_node

  def initialize(settings)
    if settings[:arr]
      @first_node = arr_to_ll(settings[:arr])
    elsif
      @first_node = settings[:first_node]
    end
  end

  def inspect
    data = []
    curr_node = @first_node
    while curr_node
      data.push(curr_node.data)
      curr_node = curr_node.next
    end
    data
  end

  private
  def arr_to_ll(arr)
    nodes = []
    arr.each do |e|
      prev_node = nodes.last
      new_node = Node.new(e)
      nodes.push(new_node)
      prev_node.next = new_node if !prev_node.nil?
    end
    nodes.first
  end
end

# assume both linked list are sorted
# should reuse node,
# use O(1) additional storage
def merge!(l, f)
  curr_node_l = l.first_node
  curr_node_f = f.first_node
  result_first_node = curr_node_f.data < curr_node_l.data ? curr_node_f : curr_node_l

  prev_node_l = nil
  while curr_node_l && curr_node_f
    if curr_node_f.data < curr_node_l.data
      temp = curr_node_f.next
      curr_node_f.next = curr_node_l
      prev_node_l.next = curr_node_f if prev_node_l
      curr_node_f = temp
    else
      prev_node_l = curr_node_l
      curr_node_l = curr_node_l.next
    end
  end

  if prev_node_l && curr_node_f
    prev_node_l.next = curr_node_f
  end

  LinkedList.new(first_node: result_first_node)
end

def merge2!(l, f)
  curr_node_l = l.first_node
  curr_node_f = f.first_node
  result_first_node = curr_node_f.data < curr_node_l.data ? curr_node_f : curr_node_l
  result_last_node = result_first_node

  while curr_node_l && curr_node_f
    if curr_node_f.data < curr_node_l.data
      n = curr_node_f.next
      result_last_node.next = curr_node_f
      curr_node_f = n
    else
      n = curr_node_l.next
      result_last_node.next = curr_node_l
      curr_node_l = n
    end
    result_last_node = result_last_node.next
  end

  if curr_node_l
    result_last_node.next = curr_node_l
  elsif curr_node_f
    result_last_node.next = curr_node_f
  end

  LinkedList.new(first_node: result_first_node)
end

l = LinkedList.new(arr: [2, 5, 7])
f = LinkedList.new(arr: [3, 11])
p merge!(l, f)

l = LinkedList.new(arr: [1, 2, 5, 7, 13])
f = LinkedList.new(arr: [3, 11])
p merge!(l, f)

l = LinkedList.new(arr: [2, 5, 7])
f = LinkedList.new(arr: [1, 3, 11, 13])
p merge!(l, f)

l = LinkedList.new(arr: [1, 2, 5, 7])
f = LinkedList.new(arr: [3, 11, 13])
p merge!(l, f)

l = LinkedList.new(arr: [2, 5, 7, 13])
f = LinkedList.new(arr: [1, 3, 11])
p merge!(l, f)

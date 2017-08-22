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

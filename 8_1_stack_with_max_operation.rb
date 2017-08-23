# Assume all element is comparable
# Solution: (P.220)
# 1. two stack, 1 normal, 1 for storing maximums
# 2. two stack, 1 normal, 1 (key, number of times) for storing maximum
#     p.s. ignore the keys than are smaller than the top of the 2nd stack and pushing/popping
class Stack
  def initialize
    @arr = []
    @sorted = []  # array of element in acending order
    @counter = {} # element => times of appear mapping
  end

  def push(element)
    @arr.push(element)
    @sorted.push(element) if @sorted.empty? || element > @sorted.last
    @counter[element] = @counter[element] ? @counter[element] + 1 : 1
  end

  def pop
    raise "Stack is empty" if empty?
    popped = @arr.pop
    raise "Element #{popped} does not exist in @counter" if @counter[popped].nil?
    raise "@sorted is empty" if @sorted.empty?
    @counter[popped] = @counter[popped] > 1 ? @counter[popped] - 1 : nil
    @sorted.pop if @sorted.last == popped && @counter[popped].nil?
    popped
  end

  def empty?
    @arr.empty?
  end

  def max
    raise "Stack is empty" if empty?
    raise "@sorted is empty" if @sorted.empty?
    @sorted.last
  end
end


s = Stack.new
s.push(1)
s.push(2)
p s.max() # 2
p s.pop() # 2
p s.max()  # 1
s.push(3)
s.push(3)
s.push(2)
p s.max() # 3
s.pop()
p s.max()  # 3
s.pop()
s.pop()
p s.max()  # 1
s.pop()


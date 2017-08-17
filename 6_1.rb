def func(a, i)
  pivot = a[i]
  same_as_pivot_count = 0
  front = 0
  rear = a.count - 1
  current = 0
  p a
  while current <= rear
    p front
    p same_as_pivot_count
    p rear
    p current
    p a[current]
    if (a[current] > pivot)
      temp = a[rear]
      a[rear] = a[current]
      a[current] = temp
      rear -= 1
    elsif a[current] < pivot
      temp = a[front]
      a[front] = a[current]
      a[current] = temp
      front += 1
      current += 1
    else
      same_as_pivot_count += 1
      current += 1
    end
    p a
    p 'lul'
  end
  a
end

def from_solution(a, i)
  pivot = a[i]
  # 4 groups
  # bottom: a[0..smaller - 1]
  # middle: a[smaller..equal - 1]
  # unclassified: a[equal..larger]
  # larger: [larger + 1..a.count - 1]
  smaller = 0
  equal = 0
  larger = a.count - 1

  # think for general cases
  while (larger >= equal) do
    if (a[equal] < pivot)
      a[smaller], a[equal] = a[equal], a[smaller]
      smaller += 1
      equal += 1
    elsif (a[equal] == pivot)
      equal += 1
    else
      a[larger], a[equal] = a[equal], a[larger]
      larger -= 1
    end
  end
  a
end

p from_solution([3,5,4,1,2,3,2], 5)
p from_solution([1,3,2,2,4,5,3], 1)

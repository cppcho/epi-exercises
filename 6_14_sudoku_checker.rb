def sudoku_checker(arr)
  # check rows
  (0..8).each do |row|
    t = []
    (0..8).each do |col|
      val = arr[row][col]
      return false if val && !t[val].nil?
      t[val] = true if val > 0
    end
  end

  # check columns
  (0..8).each do |col|
    t = []
    (0..8).each do |row|
      val = arr[row][col]
      return false if val && !t[val].nil?
      t[val] = true if val > 0
    end
  end
  # check squares
  (0..8).each do |i|
    row = (i % 3) * 3
    col = (i / 3) * 3
    t = []
    (0..8).each do |j|
      val = arr[row + (j / 3)][col + (j % 3)]
      return false if val && !t[val].nil?
      t[val] = true if val > 0
    end
  end

  true
end

A = [[0, 2, 6, 0, 0, 0, 8, 1, 0], [3, 0, 0, 7, 0, 8, 0, 0, 6],
[4, 0, 0, 0, 5, 0, 0, 0, 7], [0, 5, 0, 1, 0, 7, 0, 9, 0],
[0, 0, 3, 9, 0, 5, 1, 0, 0], [0, 4, 0, 3, 0, 2, 0, 5, 0],
[1, 0, 0, 0, 3, 0, 0, 0, 2], [5, 0, 0, 2, 0, 4, 0, 0, 9],
[0, 3, 8, 0, 0, 0, 4, 6, 0]]

p sudoku_checker(A)

A[-1] = [3, 1, 8, 0, 0, 0, 4, 6, 0]
p sudoku_checker(A)

B = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1]]

p sudoku_checker(B)

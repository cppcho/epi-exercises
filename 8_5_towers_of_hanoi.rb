def print_steps(n, from, to, intermediate)
  if n > 0
    print_steps(n - 1, from, intermediate, to)
    puts "Move from P#{from} to P#{to}"
    print_steps(n - 1, intermediate, to, from)
  end
end

print_steps(3, 1, 2, 3)

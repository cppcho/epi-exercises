def assert(expr)
    raise "This is wrong" unless expr
end
def power_set(s)
    # v1(s)
    v2(s)
end

def v1(s)
    result = []
    (0...2**s.count).each do |i|
        arr = []
        (0...s.count).each do |j|
            if i >> j & 1 == 1
                arr.push(j)
            end
        end
        result.push(s.values_at(*arr))
    end
    result
end

# from solution 1
def v2(s)
    power_set = []
    (0...1 << s.count).each do |i|
        indice = []
        while i > 0
            indice.push(Math.log2(i & ~(i - 1)).round)
            i &= i - 1
        end
        power_set.push(s.values_at(*indice))
    end
    power_set
end

p power_set [0, 1, 2]
assert power_set([0, 1, 2]) == [[], [0], [1], [0, 1], [2], [0, 2], [1, 2], [0, 1, 2]]

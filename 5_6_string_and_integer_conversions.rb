def int_to_string(x)
    raise "error" unless x.is_a? Integer

    if x == 0
        return "0"
    end

    is_negative = false
    if x < 0
        x = -x
        is_negative = true
    end

    res = []
    while x > 0
        remainder = x % 10
        res.push('0'.ord + x % 10)
        x /= 10
    end

    s = is_negative ? '-' : ''
    (res.count - 1).downto(0).each do |i|
        s += res[i].chr
    end
    s
end


def string_to_int(s)
    raise "error" unless s.is_a? String
    is_negative = s[0] == '-'
    s = s[1..-1] if is_negative
    res = 0
    s.each_char do |c|
        int_value = c.ord - "0".ord
        raise "incorrect s" unless int_value >= 0 && int_value <= 9
        res = res * 10 + int_value
    end
    res = -res if is_negative
    res
end

raise "error" unless int_to_string(123) === "123"
raise "error" unless int_to_string(0) === "0"
raise "error" unless int_to_string(-123) === "-123"

raise "error" unless string_to_int("123") === 123
raise "error" unless string_to_int("0") === 0
raise "error" unless string_to_int("-123") === -123

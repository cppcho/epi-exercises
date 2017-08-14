import sys
import random

def swap(x, i, j):
    if ((x >> i) & 1 != (x >> j) & 1):
        x ^= 1 << i | 1 << j
    return x

def simple_test():
    assert swap(0b101111, 1, 4) == 0b111101
    assert swap(0b11100, 0, 2) == 0b11001

def main():
    simple_test()
    if len(sys.argv) == 4:
        x = int(sys.argv[1])
        i = int(sys.argv[2])
        j = int(sys.argv[3])
    else:
        x = random.randint(0, sys.maxsize)
        i = random.randrange(sys.maxsize.bit_length())
        j = random.randrange(sys.maxsize.bit_length())
    print('x = %#x, i = %d, j = %d' % (x, i, j))
    print('%#x' % swap(x, i, j))


if __name__ == '__main__':
    main()

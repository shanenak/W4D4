def my_min(list)
    min = list.first
    list.each do |ele1|
        list.each do |ele2|
            min = ele1 if ele1 < min
            min = ele2 if ele2 < min 
        end
    end
    min
end

def my_min2(list)
    list.inject {|min, ele| min < ele ? min : ele }
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)

def largest_contiguous_subsum(list)
    sub_arr = []
    list.each_with_index do |ele, i| # n^2
        (i...list.length).each do |j|
            sub_arr << list[i..j]
        end
    end
    sums = sub_arr.map { |sub| sub.sum } # 2n
    sums.max # n
end

def largest_contiguous_subsum2(list)

    # iterative below
    curr_sum = list.first
    max_sum = list.sum 
    list.each_with_index do |ele, i| # n^2
        # check max_sum against ___
        # reassign max_sum when ___
    end
    sums = sub_arr.map { |sub| sub.sum } # 2n
    sums.max # n
end

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

# possible sub-sums
# p [5]           # => 5
# p [5, 3]        # => 8 --> we want this one
# p [5, 3, -7]    # => 1
# p [3]           # => 3
# p [3, -7]       # => -4
# p [-7]          # => -7
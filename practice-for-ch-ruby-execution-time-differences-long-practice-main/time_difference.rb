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
    list.each_with_index do |ele, i|
        (i...list.length).each do |j|
            sub_arr << list[i..j]
        end
    end
end

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

# possible sub-sums
p [5]           # => 5
p [5, 3]        # => 8 --> we want this one
p [5, 3, -7]    # => 1
p [3]           # => 3
p [3, -7]       # => -4
p [-7]          # => -7
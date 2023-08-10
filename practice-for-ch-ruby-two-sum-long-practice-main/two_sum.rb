def bad_two_sum?(arr, target_sum)
    # O(n^2) because there are two nested loops iterating through the array
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    # O(n) 
    arr.sort!
    arr.select! {|ele| ele < target_sum}

    i = 0
    j = arr.length - 1

    while i < j
        case arr[i] + arr[j] <=> target_sum
        when -1
            i += 1
        when 0
            return true
        when 1
            j -= 1
        end
    end
    false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
    # O(n)
    h = Hash.new(false)
    arr.each do |ele|
        h[target_sum-ele] = ele
    end
    arr.each do |ele|
        return true if h[ele] && h[ele] != ele
    end
    false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
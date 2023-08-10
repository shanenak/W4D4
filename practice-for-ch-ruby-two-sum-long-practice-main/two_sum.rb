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
    arr.sort!
    arr.select! {|ele| ele < target_sum}
end
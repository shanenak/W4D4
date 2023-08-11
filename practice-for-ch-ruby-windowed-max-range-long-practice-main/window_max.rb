def windowed_max_range(arr, window_size)
    current_max_range = 0

    (0..arr.length - window_size).each do |i|
        window = arr[i...i + window_size]
        min = window.min
        max = window.max
        current_max_range = (max - min) if current_max_range < (max - min)
    end

    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
      @store = []
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        @store.shift
    end
end

# q = MyQueue.new
# q.enqueue('S')
# q.enqueue('M')
# p q.peek
# p q.size
# q.dequeue
# p q.peek
# q.dequeue
# p q.size

class MyStack
  def initialize
    @store = []
  end

  def push(ele)
    @store << ele
  end

  def pop
    @store.pop
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end
end

# q = MyStack.new
# q.push('S')
# q.push('M')
# p q.peek
# p q.size
# p q.empty?
# q.pop
# p q.peek
# q.pop
# p q.size
# p q.empty?

class StackQueue
    def initialize
        @staging = MyStack.new
        @actual = MyStack.new
    end

    def size
        @staging.size + @actual.size 
    end

    def empty?
        @staging.empty? && @actual.empty?
    end

    def enqueue(ele)
        while !@actual.empty?
            @staging.push(@actual.pop)
        end
        @staging.push(ele)
        while !@staging.empty?
            @actual.push(@staging.pop)
        end
    end
    
    def dequeue
        @actual.pop
    end

    def peek
        @actual.peek
    end

end

q = StackQueue.new
q.enqueue('S')
q.enqueue('M')
p q.peek
p q.size
p q.empty?
q.dequeue
p q.peek
q.dequeue
p q.size
p q.empty?
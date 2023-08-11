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
    @max = [0]
    @min = [1000000]
  end

  def push(ele)
    @store << ele
    @max << ele if ele > self.max
    @min << ele if ele < self.min
  end

  def pop
    ele = @store.pop
    @max.pop if @max.last == ele
    @min.pop if @min.last == ele
  end

  def max
    @max.last
  end

  def min
    @min.last
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
# q.push(4)
# q.push(9)
# q.push(3)
# q.push(7)
# q.push(17) # [4, 9, 3, 7, 17]
# p q.peek
# p q.size
# p q.empty?
# p q.max
# p q.min
# q.pop
# p q.peek # 7
# q.pop
# p q.size # 3
# p q.max # 9
# p q.min
# p q.empty?
# q.pop
# p q.max # 9
# p q.min


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

# q = StackQueue.new
# q.enqueue('S')
# q.enqueue('M')
# p q.peek
# p q.size
# p q.empty?
# q.dequeue
# p q.peek
# q.dequeue
# p q.size
# p q.empty?

class MinMaxStackQueue
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

    def max
        case @staging.max <=> @actual.max
        when -1
            @actual.max
        when 0
            @actual.max
        when 1
            @staging.max
        end
    end

    def min
        case @staging.min <=> @actual.min
        when -1
            @staging.min
        when 0
            @actual.min
        when 1
            @actual.min
        end
    end
end

q = MinMaxStackQueue.new
q.enqueue(4)
q.enqueue(9)
q.enqueue(3)
q.enqueue(7)
q.enqueue(17) # [4, 9, 3, 7, 17]
p q.peek
p q.size
p q.empty?
p q.max
p q.min
q.dequeue
p q.peek # 7
q.dequeue
p q.size # 3
p q.max # 9
p q.min
p q.empty?
q.dequeue
p q.max # 9
p q.min
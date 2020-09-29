class MaxIntSet
  # MaxIntSet.new(max)
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end
  
  def include?(num)
    validate!(num)
    @store[num]
  end
 
  def insert(num)
      validate!(num)
      @store[num] = true
    
  end

  def remove(num)
    @store[num] = false
  end


  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  
  def insert(num)
    # return false if include?(num)
    @store[num % num_buckets].push(num)
    
  end
  
  def remove(num)
    @store[num % num_buckets].delete(num)
  end
  
  def include?(num)
     @store[num % num_buckets].include?(num) 
  end


  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  #   self.store[num]  
  # end

  def num_buckets
    self.store.length
  end
end

class ResizingIntSet
  attr_reader  :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    @store[num % num_buckets].push(num)
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    @count -= 1 if @store[num].delete(num)
  end

  #n items in general
  #k length of the array
  # n/k n == k  increase k
  #m count items in bucket buckets length
  # @store.length > inner_array.length

  def include?(num)
    @store[num % num_buckets ].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_arr = @store
    @count = 0
    @store =  Array.new(num_buckets * 2) {Array.new}
    old_arr
      .flatten
      .each {|num| insert(num)}
  end
end

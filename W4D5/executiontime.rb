def my_min1(arr)
    min = arr.first   
    (0...arr.length).each do |i| 
        
        (0...arr.length).each do |j| 
            if arr[i] <= arr[j] 
                if min > arr[i]
                    min = arr[i] 
                end
            end
        end
    end

    min
end  # O(n^2)



def my_min2(arr)
    min = arr.first # O(1)

    arr.each_index do |i| # O(n)
     min = arr[i] if min > arr[i]  # O(1)
    end
    min 
end   #O(n)


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min1(list)  # =>  -5


def largest_contiguous_subsum1(list)
    subs = []
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            subs << list[i..j]
        end
    end

    subs.map(&:sum).max
end # O(n^3)


def largest_contiguous_subsum2(list)
    sum = list.first
    
    i = 0

    while i < list.length
        beginning = list[0..i]
        ending = list[i..-1]
        if beginning.sum > sum 
            sum = beginning.sum
        elsif ending.sum > sum
            sum = ending.sum
        end
        i += 1
    end

    sum
end



list = [5, 3, -7]
puts largest_contiguous_subsum1(list) # => 8
puts largest_contiguous_subsum2(list) # => 8

# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7
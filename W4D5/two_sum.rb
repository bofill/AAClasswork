def bad_two_sum?(arr, target)
    subs = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            subs << [arr[i], arr[j]] if j > i
        end
    end
    print subs
    subs.any? {|ele| ele.sum == target}
end #O(n^2)


arr = [0, 1, 5, 7]
puts bad_two_sum?(arr, 6) # => should be true
puts bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target)
    sorted = arr.sort
    arr.each do |ele|
        pivot = ele
        return true if binary_search(arr, (target - pivot))
        # pivot + num = target / first element
    end
    false
end



# pivot1 = 0 .each
# target - pivot1 = num / return true if find the number
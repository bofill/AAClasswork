def my_uniq(arr)
    arr.uniq
end

def two_sum(arr)
    new_arr = []

    arr.each_with_index do |el, i|
        arr.each_with_index do |el1, j|
            if j > i && el + el1 == 0
                new_arr << [i, j]
            end
        end
    end

    new_arr

end

def my_transpose(arr)
    new_arr = []

    arr.each_with_index do |ele, i|
        sub_arr =[]
        arr.each_with_index do |ele2, j|
            sub_arr << arr[j][i]
        end
        new_arr << sub_arr
    end
    new_arr
end

def stock_picker(arr)
    hash = Hash.new{|h,k| h[k] = []}
    
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            if j > i
                hash[arr[j] - arr[i]] << [i,j]
            end
        end
    end

    new_hash = hash.sort.to_h
    flatten = []
    new_hash.each {|k, v| flatten += v if k > 0}
    flatten.pop(3)
end
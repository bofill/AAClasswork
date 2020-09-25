require 'tdd'

describe '#my_uniq' do
    let(:arr) { arr = [1, 2, 2, 3]}

    # it "should take an array" do
    #     expect(arr).to match_array(arr)
    # end

    it "all elements are unique" do
        expect(my_uniq(arr)).to eq([1,2,3])
    end

    it "should not modify the original array" do
        arr_obj = arr.object_id
        new_obj = my_uniq(arr).object_id
        expect(new_obj).not_to be(arr_obj)
    end   
end

describe '#two_sum' do
    let(:arr) { arr = [-1, 0, 2, -2, 1]}

    it "pairs sum should equal to 0 and sorted by index" do
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
    end
    # find unique pairs
    # array of pairs needs to be sorted
end

describe '#my_transpose' do
    let(:arr) {[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}

    it "should convert between the row-oriented and column-oriented representations" do
        expect(my_transpose(arr)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

    it "should not use built-in transpose method" do
        expect(arr).to_not receive(:transpose)
        my_transpose(arr)
    end

    # it "should not use the built-in Array#map" do
    #   array = [1,2,3]
    #   expect(array).to_not receive(:map)
    #   my_map(array) { |n| 2 * n }
    # end
end

describe '#stock_picker' do 
    let(:arr) {[1,2,4,4,1]}

    it "should find the first three profitable pairs of days" do
        expect(stock_picker(arr)).to eq([[1,3], [0,2], [0,3]])
    end

end

# [1,2,4,4,1] => []
# [0,3] [0,2] 
# [0,1],[0,2],[0,3],[0,4],[1,2],... 
# highest sum = replace it
# [0,3], [0,2], [1,3]

# {-3=>[[2, 4], [3, 4]],
#  -1=>[[1, 4]],
#  0=>[[0, 4], [2, 3]],
#  1=>[[0, 1]],
#  2=>[[1, 2], [1, 3]],
#  3=>[[0, 2], [0, 3]]}
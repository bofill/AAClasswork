require 'tower_of_hanoi'

describe TowerOfHanoi do 
    describe '#move' do
        subject(:tower){TowerOfHanoi.new}
        let(:a) {a = [1,2,3,4]}
        let(:b) {b = []}
        it 'should move between two arrays if b is empty' do
            expect(tower.move(a, b)).to eq([2,3,4], [1])
        end
    end
end






# num = a.shift
# b.unshift(num) if num < b[0] || [] 
# after thevalid move we print the arrays
# checking if either b || c == a
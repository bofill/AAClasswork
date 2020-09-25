class TowerOfHanoi
    attr_reader :a, :b, :c

    def initialize
        @a = [1,2,3,4]
        @b = []
        @c = []
    end

    def move(a, b)
        num = a.shift
        # if num < to[0] || to.empty?
        b.unshift(num) 
        #     print "#{a} #{b} #{c}"
        # else
        #     print "Try again"
        # end
    end

    def play
        # until winner?
        #     move
        # end
    end


    def winner?
        
    end
end



# a = [1,2,3,4]
# b = []
# c = []
 
# [1,2,3,4] 
# [2,3,4] [1] []
# [3,4] [1] [2]
# [4] [3] [1,2]
# [1,4] [3] [2]
# [1,4] [2,3] []
# [4] [1,2,3] []
# [] [1,2,3] [4]
# [] [2,3] [1,4]
# [2] [3] [1,4]
# [1,2] [3] [4]
# [1,2] [] [3,4]
# [2] [1] [3,4]
# [] [1] [2,3,4]
# [] [] [1,2,3,4]


require_relative "stack.rb"

class SmartStack < Stack
    def initialize(number)
        @max_size = number
        @underlying_array = []
    end

end
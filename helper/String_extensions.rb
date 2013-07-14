
class String
    def each_index
        (0..length-1).each do |i|
            yield(i)
        end
    end
end

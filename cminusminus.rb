require_relative 'helper/String_extensions.rb' # for String.each_index

class Parser
    def tokenize(s)
        words = s.split(/[\s]/)
        result = []
        for word in words do
            prev = 0
            if word !~ /[.,;:\-+*\/\[\]'"{}<>]+/
                result.push word
            else
                word.each_index do |i|
                    if word[i] =~ /[.,;:\-+*\/\[\]'"{}<>]/
                        result.push word[prev..i-1] unless i == prev
                        result.push word[i]
                        prev = i+1
                    end
                end
                result.push word[prev..-1] if word !~ /[.,;:\-+*\/\[\]'"{}<>]\Z/
            end
        end
        result
    end
end

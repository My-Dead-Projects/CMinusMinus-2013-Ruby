require 'rspec'
require_relative '../helper/String_extensions.rb'

describe String do
subject { "this is a string." }
    it 'should respond to each_index' do
        "this is a string.".should respond_to :each_index
    end
end

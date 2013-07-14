require 'rspec'
require_relative '../cminusminus.rb'

describe Parser do
    let(:parser) { Parser.new }
    it 'should split tokens on spaces' do
        expect(parser.tokenize 'this is a test').to eq %w(this is a test)
    end
    it 'should split tokens around special characters' do
        expect(parser.tokenize '.,;:-+*/[]\'"{}<>').to eq ['.',',',';',':','-','+','*','/','[',']','\'','"','{','}','<','>']
        expect(parser.tokenize 'this. is, a; test-').to eq ['this','.','is',',','a',';','test','-']
        expect(parser.tokenize '.this ,is ;a -test').to eq ['.','this',',','is',';','a','-','test']
        expect(parser.tokenize 'th.is i,s a; te-st').to eq ['th','.','is','i',',','s','a',';','te','-','st']
    end
end

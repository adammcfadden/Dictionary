require 'rspec'
require 'word'

describe(Word) do

  describe('#word') do
    it('returns the word from a word object') do
      test_word = Word.new({:word => 'penguin'})
      expect(test_word.word()).to(eq('penguin'))
    end
  end
  
end

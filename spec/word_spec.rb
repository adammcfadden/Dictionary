require 'rspec'
require 'word'

describe(Word) do

  before do
    Word.clear()
  end

  describe('#word') do
    it('returns the word from a word object') do
      test_word = Word.new({:word => 'penguin'})
      expect(test_word.word()).to(eq('penguin'))
    end
  end

  describe('.all') do
    it('will return all objects stored in the Word class array.Will be an empty array at initialize') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('save a Word object into a Word class array') do
      test_word = Word.new({:word => 'elephant'})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('will clear the Word class array') do
      test_word = Word.new({:word => 'doggie'})
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('will return the id tag given to a Word object') do
      test_word = Word.new({:word => 'panda'})
      expect(test_word.id()).to(eq(1))
    end
  end

end

require 'rspec'
require 'word'
require 'definition'

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

  describe('.find') do
    it ('will return an object that contains the input id') do
      test_word1 = Word.new({:word => 'lion'})
      test_word1.save()
      test_word2 = Word.new({:word => 'zebra'})
      test_word2.save()
      expect(Word.find(2)).to(eq(test_word2))
    end
  end

  describe('#definitions') do
    it('returns all definitions associated with a word object') do
      test_word = Word.new({:word => 'jaguar'})
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe('#definition_push') do
    it('pushes a definition object into the Word class and attaches it to a specific Word object') do
      test_definition = Definition.new({:definition => "a stripy horsey"})
      test_word = Word.new({:word => "zebra"})
      test_word.definition_push(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

end

require'rspec'
require 'definition'
require 'word'

describe(Definition) do

  describe('#definition') do
    it('returns the definition string associated with a Definition object') do
      test_definition = Definition.new(:definition => 'King of the savannah')
      expect(test_definition.definition()).to(eq('King of the savannah'))
    end
  end
end

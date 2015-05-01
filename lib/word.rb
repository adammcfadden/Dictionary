class Word

  @@words = []

  attr_reader(:word, :id)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = nil
    @definitions = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @id = @@words.length() + 1
    @@words.push(self)
  end

  define_singleton_method (:clear) do
    @@words = []
  end

  define_singleton_method (:find) do |identification|
    @@words.each() do |word|
      if word.id() == identification.to_i()
        return word
      end
    end
  end

  define_method (:definitions) do
    @definitions
  end

  define_method (:definition_push) do |definition|
    @definitions.push(definition)
  end

  define_singleton_method (:delete_word) do |identification|
    identification = (identification.to_i() - 1)
    @@words.delete_at(identification)
  end
end

class Definition

  attr_reader(:definition)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
  end

  define_method(:definition) do
    @definition
  end
  
end

require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
also_reload './lib/*/**.rb'
require 'pry'

get ('/') do
  erb(:index)
end

get('/add_new_word') do
  erb(:word_new)
end

post('/index') do
  word = Word.new({:word => params.fetch('word')})
  definition = Definition.new({:definition => params.fetch('definition')})
  word.definition_push(definition)
  word.save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  id = params.fetch('id')
  @word = Word.find(id)
  erb(:word)
end

get('/word/definitions/:id') do
  id = params.fetch('id')
  @word = Word.find(id)
  erb (:definition)
end

post('/word/:id') do
  id = params.fetch('id')
  word = Word.find(id)
  definition = Definition.new({:definition => params.fetch('add_definition')})
  word.definition_push(definition)
  word.save()
  @word = Word.find(id)
  erb (:word)
end

get ('/index') do
  @words = Word.all()
  erb(:index)
end

post ('/delete/:id') do
  id = params.fetch('id')
  Word.delete_word(id)
  all_word_objects = Word.all()
  Word.clear()
  all_word_objects.each() do |word_object|
    word_object.save()
  end
  @words = Word.all()
  erb(:index)
end

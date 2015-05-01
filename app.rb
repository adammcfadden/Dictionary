require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
also_reload './lib/*/**.rb'

get ('/') do
  erb(:index)
end

get('/add_new_word') do
  erb(:word)
end

post('/index') do
  word = Word.new({:word => params.fetch('word')})
  definition = Definition.new({:definition => params.fetch('definition')})
  word.definition_push(definition)
  word.save()
  @words = Word.all
  erb(:index)
end

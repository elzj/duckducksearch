require 'sinatra'
require_relative 'models/duck_duck_search'

get '/' do
  erb :home
end

get '/search' do
  search = DuckDuckSearch.new(params[:query])
  JSON.pretty_generate(search.results)
end
require 'sinatra'
require_relative 'models/duck_duck_search'

get '/' do
  erb :home
end

get '/search' do
  if params[:query].nil? || params[:query].empty?
    status 400
    JSON.generate(message: "Please supply a query")
  else
    search = DuckDuckSearch.new(params[:query])
    JSON.pretty_generate(search.results)
  end
end
require 'sinatra'
require_relative 'models/duck_duck_search'

get '/' do
  erb :home
end

get '/search' do
  if params[:query].blank?
    response = { errors: "Please supply a query option" }
  else
    search = DuckDuckSearch.new(params[:query])
    response = search.results
  end
  JSON.pretty_generate(response)
end
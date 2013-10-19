require File.expand_path '../test_helper.rb', __FILE__

class AppTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home
    get '/'
    assert last_response.ok?
  end
  
  def test_empty_search
    get '/search'
    assert_equal 400, last_response.status
  end

  def test_search
    get '/search?query=cupcakes'
    assert last_response.ok?
    assert last_response.body.include?('Recipes')
  end
end
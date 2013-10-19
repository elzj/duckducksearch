require File.expand_path '../test_helper.rb', __FILE__

class ParserTest < MiniTest::Unit::TestCase
  
  def setup
    file = File.read("#{File.dirname(__FILE__)}/sample.html")
    @parser = SearchResultParser.new(file)
  end
  
  def test_correct_result_count
    assert_equal 23, @parser.results.length
  end
  
  # First result should not be an ad
  def test_correct_first_result
    url = "https://en.wikipedia.org/wiki/Sherlock_Holmes"
    title = "Sherlock Holmes - Wikipedia, the free encyclopedia"
    description = "Sherlock Holmes is a fictional detective created by Scottish author and physician Sir Arthur Conan Doyle. In a series of novels and short stories, Holmes appears as a London-based consulting detective whose abilities border on the fantastic. The fictional detective is famous for his astute ..."
    result = {url: url, title: title, description: description}
    assert_equal result, @parser.results.first
  end
  
  def test_correct_last_result
    url = "http://trailers.apple.com/trailers/wb/sherlockholmes/"
    title = "Sherlock Holmes - Movie Trailers - iTunes"
    description = "In a dynamic new portrayal of Arthur Conan Doyle's most famous characters, \"Sherlock Holmes\" sends Holmes and his stalwart partner Watson on their latest challenge. Revealing fighting skills as lethal as his legendary intellect, Holmes will battle as never before to bring down a new ..."
    result = {url: url, title: title, description: description}
    assert_equal result, @parser.results.last
  end

end
require 'mechanize'
require 'json'
require_relative 'search_result_parser'

class DuckDuckSearch
  
  SEARCH_URL = 'https://duckduckgo.com/'
  SEARCH_FORM_ID = 'search_form_homepage'

  def initialize(term)
    @term = term
  end
  
  def search_page
    agent = Mechanize.new
    agent.get(SEARCH_URL)
  end
  
  def search_form
    form = search_page.form_with(:id => SEARCH_FORM_ID)
    form.q = @term
    form
  end
  
  def results_page
    search_form.submit
  end

  def results
    parser = SearchResultParser.new(results_page.content)
    parser.results
  end

end
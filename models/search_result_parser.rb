require 'nokogiri'

class SearchResultParser

  attr_reader :doc

  def initialize(html)
    @doc = Nokogiri::HTML(html)
  end

  # Collect the formatted data for each search result
  def results
    result_list.map{ |result| formatted_result(result) }.compact
  end

  private

  # The container with the actual search result content
  def result_div
    doc.at_css("div#links")
  end

  # The individual result elements
  def result_list
    result_div.css('div.results_links div.links_main.links_deep')
  end

  # Returns a hash 
  def formatted_result(result)
    link = result.css("a.large")
    return if link_is_ad?(link)
    description = result.css("div.snippet").text

    {
      url: link.attr('href').to_s, 
      title: link.text,
      description: description 
    }
  end

  # Links that don't start with 'http' are ads
  def link_is_ad?(link)
    link.attr('href').text.match(/^http/).nil?
  end

end
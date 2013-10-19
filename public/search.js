// Templates would be good here for a production app
$(document).ready(function() {
  $('#search').submit(function(event) {
    event.preventDefault();
    var query = $('#query').val()
    $.ajax({
      url: '/search?query=' + query,
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        var page_subtitle = '<h2>The top ' + data.length + ' search results for "' + query + '"</h2>'
        $('#results').html(page_subtitle + '<ul></ul>');
        $.each(data, function(i, result) {
          result_li = "<li><h3><a href='" + result.url + "'>" + result.title + 
            "</a></h3><div class='description'>" + result.description + "</div></li>"
          $('#results ul').append(result_li);
        })
      },
      error: function(data) {
        $('#results').html("Sorry, no results were found");
      }
    })
  })
})
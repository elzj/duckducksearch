Duck Duck Search
================

A simple Sinatra app that uses Mechanize to grab search data from Duck Duck Go and return it as JSON.

Example
-------

Request:

    '/search?query=cats'
    
Response:

    [
      {
        "url": "http://cats.com",
        "title": "All About Cats",
        "description": "All the information about cats that a human being could possibly require!"
      }
    ]
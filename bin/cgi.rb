#!/usr/bin/env ruby

require 'json'
require 'cgi'
require 'newsletter_reader'

cgi = CGI.new

if cgi.request_method == 'GET'
  response = NewsletterReader.newsletters

  cgi.out('status' => 'OK', 'type' => 'application/json', 'connection' => 'close') do
    response
  end
end

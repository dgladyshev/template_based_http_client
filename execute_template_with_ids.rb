#!/usr/bin/env ruby
require 'rubygems'
require 'rest_client'
require 'json'

ids_list_file = ARGV[0]

template = open(ARGV[1]).read

method = ARGV[2]

url = ARGV[3]

errors = File.new("errors.log", "w+")

IO.foreach(ids_list_file) do |id|

  begin
    # we treat every line as user id
    id = id.strip

    query = template.sub('TEMPLATE_VARIABLE', id) #todo work with template more carefully

    RestClient::Request.execute(
        method: method,
        url: url,
        payload: query,
        headers: {content_type: 'application/json'}
    )

  rescue

    errors.write("Failed to do requested action for " + id + "\n")

    next

  end

end

errors.close

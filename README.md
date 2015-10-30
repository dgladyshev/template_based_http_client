# template_based_http_client

This is a simple Ruby script. 

It has a functionality of http client, but empowers you with ability to do batch request execution based on json template.

##How it works

If you run in a console:

```ruby execute_template_with_ids.rb config/ids.list.example config/json.template.example PUT example.com```

1. script will take all user ids from ids.list.example
2. one by one, it will execute json.template.example request, changing TEMPLATE_VARIABLE string inside template with user ids from list
3. requests will go on url example.com with HTTP method PUT (all methods with unempty request body are supported)
4. so you will send custom JSON request for each id from list

##Use cases

This little script is quite useful then you have brand new feature in your service and you want to test it on several users, not on all of them.

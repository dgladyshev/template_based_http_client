# template_based_http_client

This is a simple Ruby script. 4* 5 It has a functionality of http client, but enpowers you with ability to do batch request execution based on json template.

##Example

If you run in a console

ruby execute_template_with_ids.rb config/ids.list.example config/json.template.example PUT example.com 

when script execute_template_with_ids.rb will get json.template.example and execute it as many times as quantity of strings in ids.list.example.

More of that, it will replace string TEMPLATE_VARIABLE with string from ids.list.example, so every time request will send data about different user.

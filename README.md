# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Highlighted Syntax via curl
```
curl --data "text=var foo = function() {\n    console.log('Hello');\n};\n&language=ruby" "http://0.0.0.0:3000/highlighter/rouge"

```

## Testing
```
bundle exec rspec
```

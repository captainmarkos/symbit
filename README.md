# README

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

## Services
Start up the Resque worker(s). To do so we need to pass in a QUEUE argument.
We can either pass in the name of a specific queue that we want to work on or
'*' to work on any queue.
```
bin/rake resque:work QUEUE='*'

bin/rake resque:work QUEUE='code_store_queue'
```

## Highlighted Syntax via curl
```
curl --data "text=var foo = function() {\n    console.log('Hello');\n};\n&language=javascript" "http://0.0.0.0:3000/highlighter/rouge"

```

## Testing
```
bundle exec rspec
```

## Notes & Resources

Syntax Highlighter: [https://github.com/jneen/rouge] (https://github.com/jneen/rouge)

Railscast for Resque: [http://railscasts.com/episodes/271-resque?view=asciicast] (http://railscasts.com/episodes/271-resque?view=asciicast)

Resque Web Interface: [http://0.0.0.0:3000/resque] (http://0.0.0.0:3000/resque)

# README

### Ruby version
```
ruby -v
ruby 2.4.5p335 (2018-10-18 revision 65137) [x86_64-darwin17]
```

### Rails version
```
rails -v
Rails 5.2.1.1
```

### Dependencies
This app uses Resque which uses `redis`.  Make sure redis is installed and
running.  Likewise for `mysql`.

### Configuration
```
bundle install
```

### Database Config
Setup `database.yml` with the database username and password.
```
create database symbit;
create database symbit_test;
```

### Run the app
```
rails server
```
Hit the front-end with: `http://0.0.0.0:3000/highlighter`

### Services
Start up the Resque worker(s). To do so we need to pass in a QUEUE argument.
We can either pass in the name of a specific queue that we want to work on or
'*' to work on any queue.
```
bin/rake resque:work QUEUE='*'

bin/rake resque:work QUEUE='code_store_queue'
```

### Highlighted Syntax via curl
```
curl "http://0.0.0.0:3000/highlighter/rouge" --data "text=var foo = function() {\n    console.log('Hello');\n};\n&language=javascript"

```

### Testing
```
bundle exec rspec
```

### Linter
```
rubocop
```

### References

Syntax Highlighter: [https://github.com/jneen/rouge](https://github.com/jneen/rouge)

Railscast for Resque: [http://railscasts.com/episodes/271-resque?view=asciicast](http://railscasts.com/episodes/271-resque?view=asciicast)

Resque Web Interface: [http://0.0.0.0:3000/resque](http://0.0.0.0:3000/resque)
# Code Syntax Highlighter - GUI & API Interfaces

### Ruby version
```
ruby -v
ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin17]
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
Setup `database.yml` with the database username and password.  Then create the databases.
```
create database symbit;
create database symbit_test;
```
Run database migrations.
```
bin/rake db:migrate
```

### Services
Start up the Resque worker(s). To do so we need to pass in a QUEUE argument.
We can either pass in the name of a specific queue that we want to work on or
'*' to work on any queue.
```
bin/rake resque:work QUEUE='*'

bin/rake resque:work QUEUE='code_store_queue'
```

### Run the app
```
rails server
```
Hit the front-end with: `http://0.0.0.0:3000/highlighter`

### Screenshot
![Screenshot](https://github.com/captainmarkos/symbit/blob/master/app/assets/images/symbit_code_syntax_highlighter.png)

### Highlighted Syntax via curl
`Local`
```
curl "http://0.0.0.0:3000/highlighter/rouge" --data "text=var foo = function() {\n    console.log('Hello');\n};\n&language=javascript"
```

`Staging`
```
curl "http://symbit.appspot.com/highlighter/rouge" --data "text=var foo = function() {\n    console.log('Hello');\n};\n&language=javascript"
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

### Heroku Mods

Change:
url = git@github.com:captainmarkos/yodatepicker.git 

To:
url = https://github.com/captainmarkos/yodatepicker.git 

Precompile Assets
`RAILS_ENV=production rails assets:precompile --trace`

Create Procfile.txt
https://devcenter.heroku.com/articles/procfile

To set ENV ['RAILS_MASTER_KEY']:
```
heroku config:set RAILS_MASTER_KEY=`cat config/master.key`
```

Migrate Database
`heroku run rake db:migrate`

Run rails console
`heroku run rails console`

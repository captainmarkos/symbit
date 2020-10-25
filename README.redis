# Symbit Redis

### Install
```
# Gemfile
gem 'redis', '~> 4.0'
```
`bundle install`

### Setup & Config
```
# config/redis.yml

development:
  host: <%= ENV['REDIS_HOST'] || "localhost" %>
  port: 6379
  thread_safe: true
  timeout: 60

test:
  host: <%= ENV['REDIS_HOST'] || "localhost" %>
  port: 6379
  thread_safe: true
  timeout: 60

production:
  host: <%= ENV['REDIS_HOST'] || "localhost" %>
  port: 6379
  thread_safe: true
  timeout: 60
```

```
# lib/redis.rb

R = Redis.new(Rails.application.config_for(:redis))
```

```
# config/initializers/redis.rb 

redis_options = YAML.load(
  ERB.new(
    File.read("#{Rails.root}/config/redis.yml")
  ).result
)[Rails.env]

R = Redis.new(redis_options)
```

### Usage

###### Redis Command Line
```
~> redis-cli
127.0.0.1:6379>

127.0.0.1:6379> keys *
 1) "foo"
 2) "bar"


# run the redis cli on port; server must also be on port
~> redis-cli -p 6380
127.0.0.1:6380>
```

###### Rails Console
```
[1] pry(main)> R.set('my_key', 'my_value')
=> "OK"

# R.pexpire(key, tty_milliseconds)
[1] pry(main)> R.pexpire('my_key', (1000 * 60))
=> true

[1] pry(main)> R.get('my_key')
=> "my_value"

# ttl in milliseconds
[40] pry(main)> R.pttl('my_key')
=> 1392

# R.psetex(key, ttl_milliseconds, value)
[1] pry(main)> R.psetex('foo', 5000, 'bar')
=> "OK"

[1] pry(main)> R.keys
=> ["foo", "my_key"]

```






# NOTE: using R here is a convention taken from hotel_scraper.  I'm not
#       convinced that I like it, but I'm not going to spend the time to
#       come up with an alternate right now.

#if Rails.env.test?
#  R = MockRedis.new
#else

redis_options = YAML.load(
  ERB.new(
    File.read("#{Rails.root}/config/redis.yml")
  ).result
)[Rails.env]

R = Redis.new(redis_options)
#end


#lib_redis = File.join(Rails.root, "lib", "redis.rb")
#Rails.application.config.autoload_paths += Dir[lib_redis].each {|l| require l }

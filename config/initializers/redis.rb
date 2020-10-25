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

if ENV['REDIS_URL'].present?
  uri = URI.parse(ENV["REDIS_URL"])
  R = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  R = Redis.new(redis_options)
end

#end


#lib_redis = File.join(Rails.root, "lib", "redis.rb")
#Rails.application.config.autoload_paths += Dir[lib_redis].each {|l| require l }

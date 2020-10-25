# Usage: RedisCache.new.set("some_key", "some_value")

class RedisCache
  def self.new
    Redis.new(Rails.application.config_for(:redis))
  end
end

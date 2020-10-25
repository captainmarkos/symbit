# https://gist.github.com/pubis/1459506#gistcomment-2160501
module Symbit
  class Application < Rails::Application
    config.autoload_paths += Dir[File.join(Rails.root, "lib", "redis_cache.rb")].each {|l| require l }
  end
end

require 'resque/tasks'

# load the rails env when workers start
task 'resque:setup': :environment


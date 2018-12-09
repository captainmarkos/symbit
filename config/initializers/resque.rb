# Make Resque log to a file.
#
Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))
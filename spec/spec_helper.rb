require_relative "../env"
require_relative "../lib/main_lib"
RSpec.configure do |config|
  #config.run_all_when_everything_filtered = true
  #config.filter_run :focus
  config.order = "random"
  config.before(:each) do
    Mongoid.purge!
  end
end

# improve debugging experience
require 'pry'
require 'ap'

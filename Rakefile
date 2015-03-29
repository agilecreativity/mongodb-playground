require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)
task default: :spec

task :pry do
  require "pry"
  require "awesome_print"
  # Include some module here if you like
  ARGV.clear
  Pry.start
end

desc 'Run tests and rubocop'
task :validate do
  Rake::Task['rubocop'].invoke
  Rake::Task['test'].invoke
end

task :rubocop do
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run(%w(--rails --auto-correct))
end

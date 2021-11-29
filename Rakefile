# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core'

begin
  require 'rspec/core/rake_task'
rescue LoadError
  # Ignored
end

if defined?(RSpec)
  desc 'Run specs'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
  end

  task default: %i[spec]
end

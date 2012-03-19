require 'rubygems'
require 'rubygems/package_task'
require 'rake'
require 'rake/testtask'

task :default => "test:all"

load "./khuzdul.gemspec"

Gem::PackageTask.new($gemspec) do |pkg|
  pkg.need_tar = true
end

namespace :tt do
desc 'Create Ruby source from Treetop grammar'
  task :compile do
    sh 'tt lib/khuzdul/df_raw.treetop -o lib/khuzdul/df_raw.rb'
  end
end

task :test => ['test:all']
namespace :test do
  Rake::TestTask.new("units") { |t|
    t.pattern = 'test/units/*_test.rb'
    t.libs << 'test'
    t.verbose = true
    t.warning = true
  }

  desc 'Run all tests'
  task :all do
    errors = %w(test:units).collect do |task|
      begin
        Rake::Task[task].invoke
        nil
      rescue => e
        task
      end
    end.compact
    abort "Errors running #{errors}!" if errors.any?
  end
end

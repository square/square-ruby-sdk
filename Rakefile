# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[test]

task lint: %i[rubocop]

# Legacy tests task
Minitest::TestTask.create(:legacy_test) do |t|
  t.libs << "test"
  t.test_globs = ["test/square_legacy/**/*_test.rb"]
end

# Integration tests
task :integration_test do
  integration_test_files = Dir.glob("test/square/integration/**/*.rb").sort
  cmd = "ruby -Ilib:test:. -w -e 'require \"minitest/autorun\"; "
  cmd += integration_test_files.map { |f| "require \"#{f}\"" }.join("; ")
  cmd += "'"
  sh cmd
end
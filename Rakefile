# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"
require "rubocop/rake_task"
require "rake/testtask"


# Create a test task that only runs the working tests
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList[
    'test/square/integration/inventory/test_inventory_client.rb'
    # 'test/square_legacy/api/test_*.rb'
  ]
  t.warning = false
end

# Eventual: Minitest::TestTask.create

task default: %i[test]

task lint: %i[rubocop]
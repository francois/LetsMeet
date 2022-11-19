# frozen_string_literal: true

require "byebug"
require "lets_meet"
require "ruby_event_store"
require "ruby_event_store/rspec"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    LetsMeet.configure do |config|
      config.event_store = RubyEventStore::Client.new(repository: RubyEventStore::InMemoryRepository.new(serializer: RubyEventStore::NULL))
    end
  end
end

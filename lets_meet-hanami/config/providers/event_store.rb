# frozen_string_literal: true

Hanami.app.register_provider :event_store, namespace: true do
  prepare do
    require "aggregate_root"
    require "ruby_event_store"
    require "ruby_event_store/rom"
  end

  start do
    target.start :persistence

    rom = target["persistence.config"]
    rom.register_mapper RubyEventStore::ROM::Mappers::StreamEntryToSerializedRecord
    rom.register_mapper RubyEventStore::ROM::Mappers::EventToSerializedRecord
    rom.register_relation RubyEventStore::ROM::Relations::Events
    rom.register_relation RubyEventStore::ROM::Relations::StreamEntries

    register(
      "event_store",
      RubyEventStore::Client.new(
        repository: RubyEventStore::ROM::EventRepository.new(
          rom: target["persistence.rom"]
        )
      )
    )
  end
end

# frozen_string_literal: true

require "ruby_event_store/event"

class LetsMeet::EventRegistered < RubyEventStore::Event
  def id
    data[:id]
  end

  def name
    data[:name]
  end

  def slug
    data[:slug]
  end

  def start_on
    data[:start_on]
  end

  def end_on
    data[:end_on]
  end
end

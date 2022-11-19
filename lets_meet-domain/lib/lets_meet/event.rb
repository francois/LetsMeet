# frozen_string_literal: true

require "aggregate_root"
require "lets_meet/event_registered"

class LetsMeet::Event
  include AggregateRoot

  class EventAlreadyRegistered < LetsMeet::Error; end

  def initialize
    @id = nil
    @name = nil
    @slug = nil
    @start_on = nil
    @end_on = nil
  end

  def register(id:, name:, slug:, start_on:, end_on:)
    raise EventAlreadyRegistered if @id

    apply LetsMeet::EventRegistered.new(
      data: {
        id: id,
        name: name,
        slug: slug,
        start_on: start_on,
        end_on: end_on
      }
    )
  end

  on LetsMeet::EventRegistered do |event|
    @id = event.id
    @name = event.name
    @slug = event.slug
    @start_on = event.start_on
    @end_on = event.end_on
  end
end

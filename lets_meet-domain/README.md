# Let's Meet

This is Let's Meet, a gem to handle meetups:

* Event and Attendee registration
* Attendee sign up to events

This is only the domain (as-in Domain-Driven Design sense) portion of the
application. The application delivery mechanism lives elsewhere: this gem is
free from Rails, Hanami, GraphQL or other infrastructure things like that.

## Installation

Add the gem to your Gemfile:

```ruby
gem "lets_meet-domain"
```

Then install it:

```sh
bundle install
```

## Using the Domain

Build and execute a command:

```ruby
require "lets_meet"

LetsMeet.configure do |config|
  config.command_bus = Arkency::CommandBus.new
  config.event_store = event_store
end

command = LetsMeet::RegisterEvent.new(
  id: SecureRandom.uuid,
  slug: "sherbrooke-rb-november",
  name: "Sherbrooke.rb November Meetup",
  start_on: Date.new(2022, 11, 1),
  end_on: Date.new(2022, 11, 1)
)

command_bus.call(command)
```

Fetch a domain object and execute operations against it:

```ruby
# Use the same event store as passed above in the LetsMeet.configure block
repository = AggregateRoot::Repository.new(event_store)

event_id = params[:event_id] # a UUID
event = repository.load(LetsMeet::Event.new, "event$#{event_id}")

# Call domain methods on the event:
event.open_registrations
event.cancel

# Same thing, but for an attendee instead:
attendee_id = params[:attendee_id] # a UUID

attendee = repository.load(LetsMeet::Attendee.new, "attendee$#{attendee_id}")
attendee.register_for_event(event_id)
```

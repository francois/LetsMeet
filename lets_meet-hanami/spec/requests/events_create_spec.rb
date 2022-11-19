# frozen_string_literal: true

require "lets_meet/event_registered"
require "ruby_event_store/rspec"

RSpec.describe "POST /events" do
  it "publishes an EventRegistered event" do
    expect do
      post "/events", params: {
        id: "be7b0542-f845-440a-9d86-3987b7cb8bf8",
        slug: "sherbrooke-rb-nov-meetup",
        name: "Sherbrooke.rb November Meetup",
        start_on: "2022-11-19",
        end_on: "2022-11-19"
      }
    end.to have_published(
      an_event(LetsMeet::EventRegistered)
      .with_data(
        id: "be7b0542-f845-440a-9d86-3987b7cb8bf8",
        name: "Sherbrooke.rb November Meetup",
        slug: "sherbrooke-rb-nov-meetup",
        start_on: Date.new(2022, 11, 19),
        end_on: Date.new(2022, 11, 19)
      )
    ).in(Hanami.app["settings"].event_store)
  end
end

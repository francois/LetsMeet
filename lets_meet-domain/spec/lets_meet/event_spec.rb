# frozen_string_literal: true

RSpec.describe LetsMeet::Event do
  describe "#register" do
    it "publishes an EventRegistered" do
      event = LetsMeet::Event.new

      expect do
        event.register(
          id: "aaa",
          name: "Sherbrooke.rb Nov Meetup",
          slug: "jfosd",
          start_on: Date.new(2022, 11, 19),
          end_on: Date.new(2022, 11, 19)
        )
      end.to apply(an_event(LetsMeet::EventRegistered).with_data(id: "aaa", slug: "jfosd")).in(event)
    end
  end
end

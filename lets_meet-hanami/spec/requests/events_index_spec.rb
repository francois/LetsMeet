# frozen_string_literal: true

RSpec.describe "GET /events", type: :request do
  let(:events) { app["persistence.rom"].relations[:events] }

  before do
    events.insert(
      public_id: SecureRandom.uuid,
      slug: "sherbrooke-rb-nov-meetup",
      name: "Sherbrooke.rb November Meetup",
      start_on: Date.new(2022, 11, 19),
      end_on: Date.new(2022, 11, 19)
    )

    events.insert(
      public_id: SecureRandom.uuid,
      slug: "sherbrooke-rb-dec-meetup",
      name: "Sherbrooke.rb December Meetup",
      start_on: Date.new(2022, 12, 16),
      end_on: Date.new(2022, 12, 16)
    )
  end

  it "returns the list of events" do
    get "/events"

    expect(last_response).to be_successful
    expect(last_response.body).to include("Sherbrooke.rb November Meetup")
    expect(last_response.body).to include("Sherbrooke.rb December Meetup")
  end
end

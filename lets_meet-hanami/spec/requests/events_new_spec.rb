# frozen_string_literal: true

RSpec.describe "GET /events/new", type: :request do
  it "returns a form to register an event" do
    get "/events/new"

    expect(last_response).to be_successful
    expect(last_response.content_type).to start_with("text/html")
  end
end

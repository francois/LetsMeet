# frozen_string_literal: true

module LetsMeet
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    post "/events", to: "events.create"
    get "/events/new", to: "events.new"
    get "/events", to: "events.index"
  end
end

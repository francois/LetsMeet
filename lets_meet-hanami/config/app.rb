# frozen_string_literal: true

require "hanami"

module LetsMeet
  class App < Hanami::App
    def self.event_store
      Hanami.app["event_store"]
    end
  end
end

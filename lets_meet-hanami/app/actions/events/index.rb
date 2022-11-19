# frozen_string_literal: true

module LetsMeet
  module Actions
    module Events
      class Index < LetsMeet::Action
        include Deps["persistence.rom"]

        def handle(*, response)
          events = rom.relations[:events]
            .select(:slug, :name, :start_on, :end_on)
            .order(:start_on, Sequel.function(:lower, :name))
            .to_a

          response.body = JSON.generate(events)
        end
      end
    end
  end
end

# frozen_string_literal: true

module LetsMeet
  module Actions
    module Events
      class New < LetsMeet::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end

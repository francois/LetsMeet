# frozen_string_literal: true

require_relative "lets_meet/version"

module LetsMeet
  class Error < StandardError; end

  class Config
    attr_accessor :event_store
  end

  def self.configure(&block)
    config = Config.new
    block.call(config)
    @event_store = config.event_store
  end

  class << self
    attr_reader :event_store
  end
end

require "lets_meet/event"

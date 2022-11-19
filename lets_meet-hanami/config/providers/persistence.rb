# frozen_string_literal: true

Hanami.app.register_provider :persistence, namespace: true do
  prepare do
    require "rom/core"
    require "rom/sql"

    @config = ROM::Configuration.new(:sql, target["settings"].database_url)

    register "config", @config
    register "db", @config.gateways[:default].connection
  end

  start do
    @config.auto_registration(
      target.root.join("lib/lets_meet/persistence"),
      namespace: "LetsMeet::Persistence"
    )

    register "rom", ROM.container(@config)
  end
end

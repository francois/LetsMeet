# frozen_string_literal: true

require_relative "lib/lets_meet/version"

Gem::Specification.new do |spec|
  spec.name = "lets_meet-domain"
  spec.version = LetsMeet::VERSION
  spec.authors = ["François Beausoleil"]
  spec.email = ["francois@teksol.info"]
  spec.licenses = ["MIT"]

  spec.summary = "The domain portion of the Let's Meet application"
  spec.description = "Contains only the domain portion of the Let's Meet application: event and attendee registration."
  spec.homepage = "https://github.com/francois/LetsMeet"
  spec.required_ruby_version = ">= 3.1.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/francois/LetsMeet"
  spec.metadata["changelog_uri"] = "https://github.com/francois/LetsMeet/blob/main/CHANGELOG.markdown"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `find . -type f -print0`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aggregate_root", "~> 2.5.0"
  spec.add_dependency "ruby_event_store", "~> 2.5.0"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standardrb", "~> 1.0"
end

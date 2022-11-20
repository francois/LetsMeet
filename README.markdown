# Let's Meet!

Let's Meet is an MIT-licensed application and domain in the meetup space:

* Register events and attendees
* Maintain lists of attendees, speakers, time slots and such
* Connect with external software to send emails, announcements and such
* and much more

Of course, this is the first iteration, so only the basics are provided, namely event and attendee registrations.

## Implementation

I am writing this application to learn more about [Hanami 2.0](https://hanamirb.org/) and [Rails Event Store](https://railseventsotre.org/). Thus, the application is built from the ground up to use event sourcing first: the domain is free from infrastructure concerns. The domain has no concept of the delivery mechanism used to offer its services.

Even though we use Hanami to deliver the application, we can use Rails Event Store because Rails Event Store is built in layers and has a Ruby Event Store, free from Rails concerns, namely the ActiveRecord models and Railtie.

## Organization

This repository is organized as a monorepo:

1. `web` holds the Hanami application,
2. `letsmeet` is a gem that holds the application domain.

`web` depends on `letsmeet`, but not the reverse. Each is a separate application, spec'd independently.

# For Fun

I am building this application for fun, not for profit. If it turns into a business in the future, fine, but at the moment, this is mostly a way for me to explore a different application domain and tooling. In particular, I am using [Sapling SCM](https://sapling-scm.com) to handle version control, rather than [Git](https://git-scm.com).

# Getting Started

Install any missing dependencies. This uses both Homebrew bundle and Ruby's Bundler to install dependencies:

```sh
bin/setup
```

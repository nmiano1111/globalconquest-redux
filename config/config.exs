# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :globalconq,
  ecto_repos: [Globalconq.Repo]

# Configures the endpoint
config :globalconq, Globalconq.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dcAw9tJiWWwHK7o6vpJKehTsnvYwicKQWdoZrgpY1+n0tkC4HDZnFFkFxbvxe6ym",
  render_errors: [view: Globalconq.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Globalconq.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

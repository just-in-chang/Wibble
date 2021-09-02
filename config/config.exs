# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wibble,
  ecto_repos: [Wibble.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :wibble, WibbleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7e6X4QLD1WilsHRsBh8sT7euYdKstQNJhI1lg92qqiv3DuCxmhZrNcC5OOfp5Qb4",
  render_errors: [view: WibbleWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Wibble.PubSub,
  live_view: [signing_salt: "V2ZsIqJH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

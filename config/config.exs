# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_af,
  ecto_repos: [LiveAf.Repo]

# Configures the endpoint
config :live_af, LiveAfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QdYwwOgFCnM3fkHOs5l7ohAy+lBZMsSPf83I954YAl2qZsjotmZaR57GqQEEh57o",
  render_errors: [view: LiveAfWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveAf.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "3NTg0WaUTDJxpO6lfrxZK++SAMYeJrPF"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

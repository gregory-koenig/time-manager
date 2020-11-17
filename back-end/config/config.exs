# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :plug, :validate_header_keys_during_test, true

config :api,
  ecto_repos: [Api.Repo]

# Configures the endpoint
config :api, ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vxXtOBql0VGS5bsUn4EwJ2uvNGg3Jw78w9fFPFwwbq5r9m6yzmeWC3lNak1vg2cG",
  render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "7VuypAmu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :api, Api.Guardian,
       issuer: "api",
       secret_key: "nrB1JCZFGGal2TxOZTIMMDzFY19hxB8MBc22YOtdJS9PjDm3wW2kUq7Lw2vcytGG"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

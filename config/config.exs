# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :moyo,
  ecto_repos: [Moyo.Repo]

# Configures the endpoint
config :moyo, MoyoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FqtEGIdVyjxdhavGDGtFU1l+//fykprDLhJJtg98SR3L84n7cQFvxaREgWmD96nT",
  render_errors: [view: MoyoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Moyo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :argon2_elixir,
  t_cost: 6,
  m_cost: 16

config :guardian, Guardian,
  allowed_algos: ["HS512", "HS384"],
  issuer: "Moyo",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true,
  serializer: MoyoWeb.GuardianSerializer,
  secret_key: "nWC8iV22eCmNZTH+I5J1jkj/ksL3fh0lbm/I5hs4JVEetgZC0IbJfeyr5TObbfVt"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

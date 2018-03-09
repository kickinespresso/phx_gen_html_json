# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_gen_html_json,
  ecto_repos: [PhxGenHtmlJson.Repo]

# Configures the endpoint
config :phx_gen_html_json, PhxGenHtmlJsonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+X9iO4rO1m0TZEX45MRsK0pTWmf8HX5WEAQtSgSoWVb66Y+ADn+EmY9hoKAdJ4x8",
  render_errors: [view: PhxGenHtmlJsonWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxGenHtmlJson.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

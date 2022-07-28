# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :lta_bus_timings,
  ecto_repos: [LtaBusTimings.Repo]

# Configures the endpoint
config :lta_bus_timings, LtaBusTimingsWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: LtaBusTimingsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LtaBusTimings.PubSub,
  live_view: [signing_salt: "VOlX0xU4"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :lta_bus_timings, LtaBusTimings.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :lta_bus_timings, LtaBusTimings.Scheduler,
  jobs: [
    # Runs every day at 3am:
    {"0 3 * * *", {LtaBusTimings.BusStops, :refresh_bus_stops, []}}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

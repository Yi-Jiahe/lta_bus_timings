import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :lta_bus_timings, LtaBusTimings.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "lta_bus_timings_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lta_bus_timings, LtaBusTimingsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "2DyR08RkeH6gRHV1OOra1ZKBAmQyWL6MfiODBqXJvJKvKvtwSU9Cw1WVSC7NdeNJ",
  server: false

# In test we don't send emails.
config :lta_bus_timings, LtaBusTimings.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

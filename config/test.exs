import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :micro_park, MicroPark.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "micro_park_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :micro_park, MicroParkWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "vmL85Ft2JaeiF1ei7zDHiquxT5yBnjrWp8xveV/bggRU3PFMbg/ipPw1U6gjBZa7",
  server: false

# In test we don't send emails.
config :micro_park, MicroPark.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

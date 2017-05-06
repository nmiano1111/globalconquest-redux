use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :globalconq, Globalconq.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :globalconq, Globalconq.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "globalconq_test",
  hostname: "localhost",
  port:      32768,
  pool: Ecto.Adapters.SQL.Sandbox

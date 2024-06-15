import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :my_crud_app, MyCrudApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_crud_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_crud_app, MyCrudAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lmBIFUv5ku+jnOkDPqBMKrqk0xH0oQ4QjGUdOgsmn2HIShNTfiyTVzvdArYS0m6h",
  server: false

# In test we don't send emails.
config :my_crud_app, MyCrudApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

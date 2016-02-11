use Mix.Config

config :authordb, Authordb.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "authordb_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
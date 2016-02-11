use Mix.Config

config :authordb, Authordb.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "authordb_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
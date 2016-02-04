defmodule Authordb.Mixfile do
  use Mix.Project

  def project do
    [app: :authordb,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :postgrex, :ecto],
     mod: {Authordb, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:postgrex, "~> 0.11.0"},
      {:ecto, "~> 1.1"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.drop", "ecto.create", "ecto.migrate", "run priv/repo/seed.exs"]
    ]
  end
end

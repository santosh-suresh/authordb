defmodule Authordb.Seed do
	alias Authordb.Publisher
	alias Authordb.Repo
	# import Ecto.Query

	def generate do
		_reset_db
		changeset = Publisher.changeset(%Publisher{}, %{name: "Manning", address: "Somewher in the corner of the world", city: "Bangalore", state: "Karnataka", zip: "560078"})
		_publisher = Repo.insert! changeset		
		changeset = Publisher.changeset(%Publisher{}, %{name: "OReilly", address: "Somewher in the other corner of the world", city: "Hubli", state: "Karnataka", zip: "560072"})
		_publisher = Repo.insert! changeset		
	end

	defp _reset_db do
		Mix.Task.run "ecto.drop", ["Authordb.Repo"]
		Mix.Task.run "ecto.create", ["Authordb.Repo"]
		Mix.Task.run "ecto.migrate", ["Authordb.Repo"]
	end
end

Authordb.Seed.generate
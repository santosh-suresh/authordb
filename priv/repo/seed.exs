defmodule Authordb.Seed do
	alias Authordb.Publisher
	alias Authordb.Book
	alias Authordb.Repo
	# import Ecto.Query

	def generate do
		_reset_db
		[manning, oreilly] = generate_publishers
		generate_books(10, manning)
		generate_books(12, oreilly)
	end

	defp generate_publishers do
		changeset = Publisher.changeset(%Publisher{}, %{name: "Manning", address: "Somewher in the corner of the world", city: "Bangalore", state: "Karnataka", zip: "560078"})
		manning = Repo.insert! changeset		
		changeset = Publisher.changeset(%Publisher{}, %{name: "OReilly", address: "Somewher in the other corner of the world", city: "Hubli", state: "Karnataka", zip: "560072"})
		oreilly = Repo.insert! changeset		
		[manning, oreilly]
	end

	defp _reset_db do
		Mix.Task.run "ecto.drop", ["Authordb.Repo"]
		Mix.Task.run "ecto.create", ["Authordb.Repo"]
		Mix.Task.run "ecto.migrate", ["Authordb.Repo"]
	end

	defp generate_books(count, publisher) do
		1..count
		|> Enum.each fn(n) ->
			params = %{name: "Book #{publisher.name} #{n}", pages: :random.uniform(1000), isbn: "ABCDE1234#{publisher.id}#{n}", publisher_id: publisher.id}
			chg = Book.changeset(%Book{}, params)
			if chg.valid? do
				Repo.insert! chg
			end
		end
	end
end

Authordb.Seed.generate
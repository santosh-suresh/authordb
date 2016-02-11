defmodule Authordb.Publisher do
	use Ecto.Model

	schema "publishers" do
		field :name, :string
		field :address, :string
		field :city, :string
		field :state, :string
		field :zip, :string

		has_many :books, Authordb.Book
		timestamps
	end

	@required_fields ~w(name address city state zip)
	@optional_fields ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_fields, @optional_fields)
	end

	def find_by_name(name) do
		from p in Authordb.Publisher, where: p.name == ^name
	end

end
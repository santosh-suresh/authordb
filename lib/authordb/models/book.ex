defmodule Authordb.Book do
	use Ecto.Model

	schema "books" do
		field :name, :string
		field :isbn, :string
		field :pages, :integer
		belongs_to :publisher, Authordb.Publisher

		timestamps
	end

	@required_fields ~w(name isbn pages publisher_id)
	@optional_fields ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_fields, @optional_fields)
		|> validate_length(:isbn, min: 10, max: 13)
		|> validate_number(:pages, greater_than: 0)
		|> change_case(:isbn)
		|> foreign_key_constraint(:publisher_id)
		|> unique_constraint(:isbn)		
	end

	def for_publisher(query, pub) do
		from b in query,
		  join: p in assoc(b, :publisher),
		  where: p.id == ^pub.id
	end

	defp change_case(changeset, field) do
		if isbn = get_change(changeset, field) do
			changeset
			|> put_change(field, String.upcase(isbn))
		end
	end




end
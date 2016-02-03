defmodule Authordb.Repo.Migrations.AddBookTable do
  use Ecto.Migration

  def change do
  	create table(:books) do
  		add :name, :string
  		add :isbn, :string
  		add :pages, :integer
  		add :publisher_id, references(:publishers)

  		timestamps
  	end

  	create unique_index(:books, [:isbn])
  end
end

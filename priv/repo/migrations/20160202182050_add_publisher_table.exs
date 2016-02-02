defmodule Authordb.Repo.Migrations.AddPublisherTable do
  use Ecto.Migration

  def change do
  	create table(:publishers) do
  		add :name, :string
  		add :address, :text
  		add :city, :string
  		add :state, :string
  		add :zip, :string

  		timestamps
  	end
  end
end

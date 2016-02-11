defmodule Authordb.CategoryTest do
    use ExUnit.Case
    alias Authordb.Repo
    alias Authordb.Category

    setup do
        Ecto.Adapters.SQL.restart_test_transaction(Repo, [])
        on_exit fn ->
            Ecto.Adapters.SQL.rollback_test_transaction(Repo)
        end
    end

    test "Invalid changeset is refuted" do
        changeset = Category.changeset(%Category{},%{})
        refute changeset.valid?
    end

    test "Valid changeset is not refuted" do
        changeset = Category.changeset(%Category{},%{name: "Books"})
        assert changeset.valid?
    end

    test "Unique constraint on the category works" do
        changeset = Category.changeset(%Category{},%{name: "Books"})
        Repo.insert! changeset
        dup_changeset = Category.changeset(%Category{},%{name: "Books"})
        {:error, changeset} = Repo.insert dup_changeset
        assert {:name, "has already been taken"} in changeset.errors
        refute changeset.valid?
    end


end
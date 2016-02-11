defmodule Authordb.PublisherTest do
    use ExUnit.Case
    alias Authordb.Repo
    alias Authordb.Publisher


    setup do
        Ecto.Adapters.SQL.restart_test_transaction(Repo, [])
        on_exit fn ->
            Ecto.Adapters.SQL.rollback_test_transaction(Repo)
        end
    end

    test "Invalid changeset is refuted" do
        changeset = Publisher.changeset(%Publisher{},%{name: "Santosh"})
        refute changeset.valid?
    end

    test "valid changeset is accepted" do
        changeset = Publisher.changeset(%Publisher{}, %{name: "Santosh", city: "Bangalore", state: "KA", address: "ABC 1234", zip: "560078"})
        assert changeset.valid? == true
    end

    test "valid changeset is inserted properly" do
        changeset = Publisher.changeset(%Publisher{}, %{name: "Santosh", city: "Bangalore", state: "KA", address: "ABC 1234", zip: "560078"})
        assert changeset.valid? == true
        publisher = Repo.insert! changeset
        assert publisher.id > 0
    end

    test "find by publisher" do
        changeset = Publisher.changeset(%Publisher{}, %{name: "Santosh", city: "Bangalore", state: "KA", address: "ABC 1234", zip: "560078"})
        assert changeset.valid? == true
        publisher = Repo.insert! changeset
        found = Publisher.find_by_name("Santosh") |> Repo.all
        assert Enum.count(found) == 1
        assert List.first(found).id == publisher.id
    end

    test "find all books by publisher" do

    end

end
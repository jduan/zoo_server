defmodule ZooServerTest do
  use ExUnit.Case
  doctest ZooServer
  alias ZooServer.Models
  alias ZooServer.Client

  @animal ZooServer.Helper.animal("daizy", 100, :elephant)

  setup do
    on_exit fn ->
      :ets.delete_all_objects(:animals)
    end
  end

  test "get animal that exists" do
    create_animal()

    response = get_animal("0")
    assert %{@animal | id: "0"} == response.animal
  end

  test "get animal that doesn't exist" do
    response = get_animal("0")
    error_entry = Models.ErrorEntry.new(
      reason: Models.ErrorReason.resource_not_found,
      message: "animal not found",
      # location defaults to :undefined when not specified
      # see https://github.com/pinterest/riffed/issues/31
      location: nil
    )
    error = Models.Error.new(errors: [error_entry])
    assert response.error == error
  end

  defp create_animal() do
    request = Models.AnimalsCreateRequest.new(animal: @animal)
    Client.create(request)
  end

  defp get_animal(id) do
    request = ZooServer.Models.AnimalsGetRequest.new(id: id)
    ZooServer.Client.get(request)
  end
end

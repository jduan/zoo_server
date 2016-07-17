defmodule ZooServerTest do
  use ExUnit.Case
  doctest ZooServer
  alias ZooServer.Models
  alias ZooServer.Client

  @animal Models.Animal.new(
    type: Models.AnimalType.elephant,
    name: "daizy",
    weight: 100
  )

  setup do
    response = create_animal()
    on_exit fn ->
      :ets
    end
  end

  test "create and get animal" do
    response = create_animal()
    assert %{@animal | id: "0"} == response.animal
  end

  defp create_animal() do
    request = Models.AnimalsCreateRequest.new(animal: @animal)
    Client.create(request)
  end
end

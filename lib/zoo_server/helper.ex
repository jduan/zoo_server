defmodule ZooServer.Helper do
  alias ZooServer.Models

  @animal_type_lookup %{
    elephant: Models.AnimalType.elephant,
    monkey: Models.AnimalType.monkey,
    giraffe: Models.AnimalType.giraffe,
  }

  def animal_type(type) do
    IO.puts("animal type lookup: #{inspect type}")
    @animal_type_lookup[type]
  end

  def animal(name, weight, type) do
    Models.Animal.new(
      type: animal_type(type),
      name: "daizy",
      weight: 100
    )
  end
end

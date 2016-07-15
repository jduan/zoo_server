defmodule ZooServer.Handler do
  use GenServer
  alias ZooServer.Models

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, Keyword.merge(opts, name: __MODULE__))
  end

  def init(:ok) do
    db = :ets.new(:animals, [:public, :named_table, read_concurrency: true])
    {:ok, db}
  end

  def get(%Models.AnimalsGetRequest{id: animal_id}) do
    # case :ets.lookup(:animals, animal_id) do
    #   [{^animal_id, animal}] -> %Models.AnimalsGetResponse{animal: animal}
    #   # [] -> %Models.AnimalsGetResponse{error: }
    #   [] -> :error
    # end
    animal = ZooServer.Models.Animal.new(id: "1",
      type: ZooServer.Models.AnimalType.elephant, name: "daizy")
    ZooServer.Models.AnimalsGetResponse.new(animal: animal)
  end

  def create(%Models.AnimalsCreateRequest{animal: animal = %Models.Animal{type: type, name: name, weight: weight}}) do
    id = :ets.info(:animals, :size)
    new_animal = Models.Animal.new(id: Integer.to_string(id), type: type, name: name, weight: weight)
    :ets.insert_new(:animals, {id, new_animal})
    ZooServer.Models.AnimalsCreateResponse.new(animal: new_animal)
  end
end

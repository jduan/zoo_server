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
    IO.puts "Server #{inspect self} is handling get request, id: #{animal_id}"
    :timer.sleep(1000)
    id_int = String.to_integer(animal_id)
    case :ets.lookup(:animals, id_int) do
      [{^id_int, animal}] ->
        IO.puts "Server #{inspect self} is done handling get request, id: #{animal_id}"
        %Models.AnimalsGetResponse{animal: animal}
      [] ->
        error_entry = Models.ErrorEntry.new(
          reason: Models.ErrorReason.resource_not_found, message: "animal not found")
        error = Models.Error.new(errors: [error_entry])
        IO.puts "Server #{inspect self} is done handling get request, id: #{animal_id}"
        %Models.AnimalsGetResponse{error: error}
    end
  end

  def create(%Models.AnimalsCreateRequest{animal: animal}) do
    IO.puts "Server #{inspect self} is handling create request"
    id = :ets.info(:animals, :size)
    new_animal = %{animal | id: Integer.to_string(id)}
    :ets.insert_new(:animals, {id, new_animal})
    ZooServer.Models.AnimalsCreateResponse.new(animal: new_animal)
  end
end

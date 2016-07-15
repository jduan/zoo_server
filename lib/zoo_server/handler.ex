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
    id_int = String.to_integer(animal_id)
    IO.puts("id_int is #{id_int}")
    case :ets.lookup(:animals, id_int) do
      [{^id_int, animal}] -> %Models.AnimalsGetResponse{animal: animal}
      # [] -> %Models.AnimalsGetResponse{error: }
      [] -> :error
    end
  end

  def create(%Models.AnimalsCreateRequest{animal: animal}) do
    id = :ets.info(:animals, :size)
    new_animal = %{animal | id: Integer.to_string(id)}
    :ets.insert_new(:animals, {id, new_animal})
    ZooServer.Models.AnimalsCreateResponse.new(animal: new_animal)
  end
end

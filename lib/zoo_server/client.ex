defmodule ZooServer.Client do
  use Riffed.Client,
  auto_import_structs: false,
  structs: ZooServer.Models,
  client_opts: [
    host: "localhost",
    port: 2112,
    retries: 3,
    framed: true
  ],
  service: :animals_thrift,
  import: [:get]
end

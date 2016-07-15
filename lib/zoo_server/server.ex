defmodule ZooServer.Server do
  use Riffed.Server,
  service: :animals_thrift,
  structs: ZooServer.Models,
  functions: [
    get: &ZooServer.Handler.get/1,
    create: &ZooServer.Handler.create/1,
  ],
  server: {
    :thrift_socket_server,
    port: 2112,
    framed: true,
    max: 10_000,
    socket_opts: [
      recv_timeout: 3000,
      keepalive: true
    ]
  }

  defenum AnimalType do
    :elephant -> 1
    :monkey -> 2
    :giraffe -> 3
  end

  defenum ErrorReason do
    :invalid_parameter -> 1
    :bad_request -> 2
    :invalid_credentials -> 3
    :insufficient_privileges -> 4
    :insufficient_permissions -> 5
    :backend_error -> 6
    :resource_not_found -> 7
    :resource_already_exists -> 8
  end

  enumerize_struct Animal, type: AnimalType
  enumerize_struct ErrorEntry, type: ErrorReason
end

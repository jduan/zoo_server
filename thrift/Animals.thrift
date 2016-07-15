namespace java com.fitbit.example.zoo.server.thriftjava

include "AuthenticatedUser.thrift"
include "Core.thrift"
include "Error.thrift"

// Supported animal types
enum AnimalType {
    ELEPHANT = 1
    MONKEY = 2
    GIRAFFE = 3
}

struct Animal {
    // The id of the animal
    1: Core.Id id

    // The type of this animal
    2: AnimalType type

    3: string name

    4: optional double weight
}

// Request struct to create an Animal
struct AnimalsCreateRequest {
    // Animal to be created
    1: required Animal animal

    // requestor's details
    1000: optional AuthenticatedUser.AuthenticatedUser authenticatedUser
}

// Request struct to retrieve an Animal
struct AnimalsGetRequest {
    // Animal to be retrieved
    1: required Core.Id id

    // requestor's details
    1000: optional AuthenticatedUser.AuthenticatedUser authenticatedUser
}

// Retrieve multiple animals
struct AnimalsCollectRequest {
    1: required list<Core.Id> ids

    // requestor's details
    1000: optional AuthenticatedUser.AuthenticatedUser authenticatedUser
}

// Response struct for create request.
struct AnimalsCreateResponse {
    // Animal created (with persistence id)
    1: optional Animal animal

    // error, if any
    1000: optional Error.Error error
}

// Response struct for get request.
struct AnimalsGetResponse {
    // Animal retrieved (with persistence id)
    1: optional Animal animal

    // error, if any
    1000: optional Error.Error error
}

// Response struct for getting multiple animals
struct AnimalsCollectResponse {
    1: optional list<Animal> animals

    // error, if any
    1000: optional Error.Error error
}

// Manages the animals in the Zoo.
service Animals {
    AnimalsCreateResponse create(1: AnimalsCreateRequest request)
    AnimalsGetResponse get(1: AnimalsGetRequest request)
    AnimalsCollectResponse collect(1: AnimalsCollectRequest request)
}

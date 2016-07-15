# create an animal
animal = ZooServer.Models.Animal.new(
  id: "1",
  type: ZooServer.Models.AnimalType.elephant,
  name: "daizy")
request = ZooServer.Models.AnimalsCreateRequest.new(animal: animal)

# get an animal
request = ZooServer.Models.AnimalsGetRequest.new(id: "1")
ZooServer.Client.get(request)

# create an animal
animal = ZooServer.Models.Animal.new(
  id: "1",
  type: ZooServer.Models.AnimalType.elephant,
  name: "daizy")
request = ZooServer.Models.AnimalsCreateRequest.new(animal: animal)
ZooServer.Client.create(request)

# get an animal
request = ZooServer.Models.AnimalsGetRequest.new(id: "0")
ZooServer.Client.get(request)

using Greeter;
using Grpc.Net.Client;

var channel = GrpcChannel.ForAddress("http://localhost:5151");
var client = new Greeter.Greeter.GreeterClient(channel);

var response = client.SayHello(
    new HelloRequest() { Name = "World" });

Console.WriteLine(response.Message);
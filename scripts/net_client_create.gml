///net_client_create(IP, port)
/*
 * Creates a client. Run this script once to create a new client.
 *
 * IP:   The IP to connect to (must be a server created in GameMaker:Studio).
 * port: The port to connect to.
 *
 * Returns: true if the creation succeeded, false otherwise
*/
//Don't create two clients in the same program
if(net_is_client())
{
    show_error("Could not create client. Reason: Client has already been created.", false);
    return false;
}
if(net_is_server())
{
    show_error("Could not create client. Reason: Server has already been created.", false);
    return false;
}
//Read arguments
var IP = argument0, port = argument1;
//Create client object
var client = instance_create(0, 0, obj_client);
//Create client
client.client = network_create_socket(network_socket_tcp);
if(client.client < 0)
{
    with(client)
        instance_destroy();
    show_error("Could not create client. Reason: Unknown", false);
    return false;
}
//Create buffer
client.buffer = buffer_create(2048, buffer_fixed, 1);

//Set timeout. If the client cannot connect within 2 seconds, it will timeout and return false
network_set_config(network_config_connect_timeout, 2000);

//Connect to the server
if(network_connect(client.client, IP, port) >= 0)
{
    return true;
}
else //Could not connect
{
    net_client_destroy();
    show_error("Could not create client. Reason: Could not connect to " + IP + ":" + string(port), false);
}
return false;

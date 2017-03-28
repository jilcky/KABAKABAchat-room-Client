///net_server_create(port, maxClients)
/*
 * Creates a server. Run this script once to create a new server.
 *
 * port:       The port to use (must be forwarded).
 * maxClients: The maximum number of clients that can be connected.
 *
 * Returns: true if the creation succeeded, false otherwise
*/
//Don't create two servers in the same program
if(net_is_server())
{
    show_error("Could not create server. Reason: Server has already been created.", false);
    return false;
}
if(net_is_client())
{
    show_error("Could not create server. Reason: Client has already been created.", false);
    return false;
}
//Read arguments
var port = argument0, maxClients = argument1;
//Create server object
var server = instance_create(0, 0, obj_server);
//Create server
server.server = network_create_server(network_socket_tcp, port, maxClients);
if(server.server < 0)
{
    with(server)
        instance_destroy();
    show_error("Could not create server. Reason: Unknown. Port is probably occupied", false);
    return false;
}
//Create buffer
server.buffer = buffer_create(2048, buffer_grow, 1);
//Create socket list
server.sockets = ds_list_create();
//Create channel list
server.channel = ds_list_create();
return true;

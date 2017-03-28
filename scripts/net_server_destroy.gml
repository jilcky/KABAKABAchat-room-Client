///net_server_destroy([message])
/*
 * Destroys the network socket. This will disconnect all clients, but will send a
 * packet containing information about the disconnection.
 *
 * [message]: The message to send to the clients. If left out, the message will be
 *            "Server has shut down".
 *
 * Returns: None
*/

if(net_is_server())
{
    //Set the message
    var message = "Server has shut down";
    if(argument_count > 0)
        message = argument[0];
        
    //Create the shutdown package
    net_packet_create("Shutdown");
    net_packet_add(message);
    net_packet_send(Net.AllClients);
    
    //Remove the server
    with(obj_server)
    {
        network_destroy(server);
        buffer_delete(buffer);
        ds_list_destroy(sockets);
        ds_list_destroy(channel);
        instance_destroy();
    }
    with(obj_packet_controller)
    {
        instance_destroy();
    }
}

///net_server_disconnect_client(client, [message])
/*
 * Disconnects the given client. Net.AllClients and Net.RandomClient can both be used.
 *
 * client:    The client to disconnect from the server
 * [message]: The message to send to the client. If left out, the client will not show
 *            any message.
 *
 * Returns: None
*/

if(net_is_server())
{
    //Set the message
    var message = "";
    if(argument_count > 1)
        message = argument[1];
    
    //Create shutdown packet
    net_packet_create("Shutdown");
    net_packet_add(message);
    net_packet_send(argument[0]);
}
